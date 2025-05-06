import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ZenzoapiCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? phonenumber = '',
  }) async {
    final ffApiRequestBody = '''
{
  "challanNo": "P2021019289",
  "contactno": "${escapeStringForJson(phonenumber)}",
  "contactName": "user"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'zenzoapi',
      apiUrl:
          'https://zenedspilotapi.zhl.in/gateway/eds_pvt/api/v1/leads/create/elderbliss',
      callType: ApiCallType.POST,
      headers: {
        'ziqitza-api-key': '\tn53g9GMcoWzmnKV3XCrRbmrXl6P6Ngag',
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAuthTokenCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "loginId": "emlxaXR6YV9kaWFsXzEwMzM=",
  "password": "QWNjPD1ianhkWCE4U2Nn"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetAuthToken',
      apiUrl:
          'https://zenedspilotapi.zhl.in/gateway/user_pvt/api/v1/auth/client-login',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'ziqitza-api-key': 'n53g9GMcoWzmnKV3XCrRbmrXl6P6Ngag',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? accesstoken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.access_token''',
      ));
}

class ZohoauthCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Zohoauth',
      apiUrl: 'https://accounts.zoho.in/oauth/v2/token',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'client_id': "1000.E8B819O613VF42FPC0YPO7O6W5O73D",
        'client_secret': "9ee3b68ae27fb7527647160a26d8149001e33f9a15",
        'refresh_token':
            "1000.c25eed2e338e292335986d3a5b1c4f4f.2677f8be1813dccb9d27ba79c3b157ce",
        'grant_type': "refresh_token",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? zohoauthtoken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
}

class ZohocreateleadCall {
  static Future<ApiCallResponse> call({
    String? accesstoken = '',
    String? name = '',
    String? phonenumber = '',
  }) async {
    final ffApiRequestBody = '''
{
  "data": [
    {
      "Last_Name": "${escapeStringForJson(name)}",
      "Company": "ABC Pvt Ltd",
      "Phone": "${escapeStringForJson(phonenumber)}",
      "Email": "abc@example.com",
      "Lead_Source": "App",
      "Lead_Status": "New"
    }
  ],
  "trigger": [
    "approval",
    "workflow",
    "blueprint"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'zohocreatelead',
      apiUrl: 'https://www.zohoapis.in/crm/v2/Leads',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accesstoken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
