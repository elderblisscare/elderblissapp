import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "date_of_birth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "name_emergency" field.
  String? _nameEmergency;
  String get nameEmergency => _nameEmergency ?? '';
  bool hasNameEmergency() => _nameEmergency != null;

  // "contact_emergency" field.
  String? _contactEmergency;
  String get contactEmergency => _contactEmergency ?? '';
  bool hasContactEmergency() => _contactEmergency != null;

  // "relation_emergency" field.
  String? _relationEmergency;
  String get relationEmergency => _relationEmergency ?? '';
  bool hasRelationEmergency() => _relationEmergency != null;

  // "blood_group" field.
  String? _bloodGroup;
  String get bloodGroup => _bloodGroup ?? '';
  bool hasBloodGroup() => _bloodGroup != null;

  // "medical_condition" field.
  String? _medicalCondition;
  String get medicalCondition => _medicalCondition ?? '';
  bool hasMedicalCondition() => _medicalCondition != null;

  // "Drug_allergy" field.
  String? _drugAllergy;
  String get drugAllergy => _drugAllergy ?? '';
  bool hasDrugAllergy() => _drugAllergy != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _dateOfBirth = snapshotData['date_of_birth'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _nameEmergency = snapshotData['name_emergency'] as String?;
    _contactEmergency = snapshotData['contact_emergency'] as String?;
    _relationEmergency = snapshotData['relation_emergency'] as String?;
    _bloodGroup = snapshotData['blood_group'] as String?;
    _medicalCondition = snapshotData['medical_condition'] as String?;
    _drugAllergy = snapshotData['Drug_allergy'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? displayName,
  String? uid,
  String? phoneNumber,
  DateTime? createdTime,
  String? role,
  DateTime? dateOfBirth,
  String? email,
  String? photoUrl,
  String? nameEmergency,
  String? contactEmergency,
  String? relationEmergency,
  String? bloodGroup,
  String? medicalCondition,
  String? drugAllergy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'uid': uid,
      'phone_number': phoneNumber,
      'created_time': createdTime,
      'role': role,
      'date_of_birth': dateOfBirth,
      'email': email,
      'photo_url': photoUrl,
      'name_emergency': nameEmergency,
      'contact_emergency': contactEmergency,
      'relation_emergency': relationEmergency,
      'blood_group': bloodGroup,
      'medical_condition': medicalCondition,
      'Drug_allergy': drugAllergy,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.createdTime == e2?.createdTime &&
        e1?.role == e2?.role &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.nameEmergency == e2?.nameEmergency &&
        e1?.contactEmergency == e2?.contactEmergency &&
        e1?.relationEmergency == e2?.relationEmergency &&
        e1?.bloodGroup == e2?.bloodGroup &&
        e1?.medicalCondition == e2?.medicalCondition &&
        e1?.drugAllergy == e2?.drugAllergy;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.uid,
        e?.phoneNumber,
        e?.createdTime,
        e?.role,
        e?.dateOfBirth,
        e?.email,
        e?.photoUrl,
        e?.nameEmergency,
        e?.contactEmergency,
        e?.relationEmergency,
        e?.bloodGroup,
        e?.medicalCondition,
        e?.drugAllergy
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
