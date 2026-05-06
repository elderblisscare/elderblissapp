import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _authtoken = prefs.getString('ff_authtoken') ?? _authtoken;
    });
    _safeInit(() {
      _name = prefs.getString('ff_name') ?? _name;
    });
    _safeInit(() {
      _emergencyName = prefs.getString('ff_emergencyName') ?? _emergencyName;
    });
    _safeInit(() {
      _emergencyContact =
          prefs.getString('ff_emergencyContact') ?? _emergencyContact;
    });
    _safeInit(() {
      _emergencyRelation =
          prefs.getString('ff_emergencyRelation') ?? _emergencyRelation;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _authtoken = '';
  String get authtoken => _authtoken;
  set authtoken(String value) {
    _authtoken = value;
    prefs.setString('ff_authtoken', value);
  }

  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
    prefs.setString('ff_name', value);
  }

  String _phonenumber = '';
  String get phonenumber => _phonenumber;
  set phonenumber(String value) {
    _phonenumber = value;
  }

  String _zohoauthtoken = '';
  String get zohoauthtoken => _zohoauthtoken;
  set zohoauthtoken(String value) {
    _zohoauthtoken = value;
  }

  String _emergencyName = '';
  String get emergencyName => _emergencyName;
  set emergencyName(String value) {
    _emergencyName = value;
    prefs.setString('ff_emergencyName', value);
  }

  String _emergencyContact = '';
  String get emergencyContact => _emergencyContact;
  set emergencyContact(String value) {
    _emergencyContact = value;
    prefs.setString('ff_emergencyContact', value);
  }

  String _emergencyRelation = '';
  String get emergencyRelation => _emergencyRelation;
  set emergencyRelation(String value) {
    _emergencyRelation = value;
    prefs.setString('ff_emergencyRelation', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
