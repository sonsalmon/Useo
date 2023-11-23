import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '/backend/schema/structs/index.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  String _tempProfilePic = '';
  String get tempProfilePic => _tempProfilePic;
  set tempProfilePic(String _value) {
    _tempProfilePic = _value;
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _signupnickname = '';
  String get signupnickname => _signupnickname;
  set signupnickname(String _value) {
    _signupnickname = _value;
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

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  set isSignedIn(bool _value) {
    _isSignedIn = _value;
  }

  BookStruct _mostRecentReadBook = BookStruct();
  BookStruct get mostRecentReadBook => _mostRecentReadBook;
  set mostRecentReadBook(BookStruct _value) {
    _mostRecentReadBook = _value;
  }

  String _loginToken = '';
  String get loginToken => _loginToken;
  set loginToken(String _value) {
    _loginToken = _value;
    notifyListeners();
  }

  List<String> _notes = [];
  List<String> get notes => List.unmodifiable(_notes); //수정 불가
  set notes(List<String> value) {
    _notes = value;
  }

  // Position _userPosition = Position(
  //     longitude: 0,
  //     latitude: 0,
  //     timestamp: DateTime(2000),
  //     accuracy: 0,
  //     altitude: 0,
  //     altitudeAccuracy: 0,
  //     heading: 0,
  //     headingAccuracy: 0,
  //     speed: 0,
  //     speedAccuracy: 0);
  // Position get userPosition => _userPosition;
  // set userPosition(Position _value) {
  //   _userPosition = _value;
  // }
  double _userLatitude = 0;
  double get userLatitude => _userLatitude;
  set userLatitude(double _value) {
    _userLatitude = _value;
  }

  double _userLongitude = 0;
  double get userLongitude => _userLongitude;
  set userLongitude(double _value) {
    _userLongitude = _value;
  }

  void addNote(String note) {
    _notes.add(note);
  }

  void removeNote(String note) {
    _notes.remove(note);
  }

  void flushNote() {
    _notes = [];
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
