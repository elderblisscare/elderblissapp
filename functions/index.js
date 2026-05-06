const functions = require("firebase-functions/v1");
const admin = require("firebase-admin");
const twilio = require("twilio");

admin.initializeApp();

exports.sendEmergencySmsViaProvider = functions.https.onCall(async (data) => {
  const contacts = Array.isArray(data && data.contacts) ? data.contacts : [];
  const body = ((data && data.body) || "").toString().trim();

  if (!contacts.length || !body) {
    throw new functions.https.HttpsError(
        "invalid-argument",
        "contacts and body are required",
    );
  }

  const config = functions.config() || {};
  const twilioConfig = config.twilio || {};
  const accountSid = twilioConfig.account_sid || process.env.TWILIO_ACCOUNT_SID;
  const authToken = twilioConfig.auth_token || process.env.TWILIO_AUTH_TOKEN;
  const fromNumber = twilioConfig.from_number || process.env.TWILIO_FROM_NUMBER;

  if (!accountSid || !authToken || !fromNumber) {
    return {
      success: false,
      message: "Backend SMS provider is not configured.",
      sentContacts: [],
      failedContacts: contacts,
    };
  }

  const client = twilio(accountSid, authToken);
  const sentContacts = [];
  const failedContacts = [];

  for (const rawContact of contacts) {
    const normalized = rawContact.toString().trim();
    if (!normalized) {
      failedContacts.push(rawContact);
      continue;
    }

    try {
      await client.messages.create({
        body,
        from: fromNumber,
        to: normalized,
      });
      sentContacts.push(normalized);
    } catch (e) {
      console.error("sendEmergencySmsViaProvider failed for", normalized, e);
      failedContacts.push(normalized);
    }
  }

  return {
    success: sentContacts.length > 0,
    message: failedContacts.length === 0 ?
      "Backend SMS sent to all contacts." :
      "Backend SMS sent to " + sentContacts.length +
      " contact(s), failed for " + failedContacts.length + ".",
    sentContacts,
    failedContacts,
  };
});

