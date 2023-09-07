import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _signupEmail = '';
  String get signupEmail => _signupEmail;
  set signupEmail(String _value) {
    _signupEmail = _value;
  }

  String _signupPassword = '';
  String get signupPassword => _signupPassword;
  set signupPassword(String _value) {
    _signupPassword = _value;
  }

  String _signupUsername = '';
  String get signupUsername => _signupUsername;
  set signupUsername(String _value) {
    _signupUsername = _value;
  }

  String _currentSearch = '';
  String get currentSearch => _currentSearch;
  set currentSearch(String _value) {
    _currentSearch = _value;
  }

  bool _dummyBool = true;
  bool get dummyBool => _dummyBool;
  set dummyBool(bool _value) {
    _dummyBool = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
