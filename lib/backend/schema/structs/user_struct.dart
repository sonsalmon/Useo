// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    int? userId,
    String? userName,
    String? userLocation,
    List<BookStruct>? userBookList,
  })  : _userId = userId,
        _userName = userName,
        _userLocation = userLocation,
        _userBookList = userBookList;

  // "userId" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;
  void incrementUserId(int amount) => _userId = userId + amount;
  bool hasUserId() => _userId != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;
  bool hasUserName() => _userName != null;

  // "userLocation" field.
  String? _userLocation;
  String get userLocation => _userLocation ?? '';
  set userLocation(String? val) => _userLocation = val;
  bool hasUserLocation() => _userLocation != null;

  // "userBookList" field.
  List<BookStruct>? _userBookList;
  List<BookStruct> get userBookList => _userBookList ?? const [];
  set userBookList(List<BookStruct>? val) => _userBookList = val;
  void updateUserBookList(Function(List<BookStruct>) updateFn) =>
      updateFn(_userBookList ??= []);
  bool hasUserBookList() => _userBookList != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        userId: castToType<int>(data['userId']),
        userName: data['userName'] as String?,
        userLocation: data['userLocation'] as String?,
        userBookList: getStructList(
          data['userBookList'],
          BookStruct.fromMap,
        ),
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'userId': _userId,
        'userName': _userName,
        'userLocation': _userLocation,
        'userBookList': _userBookList?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userId': serializeParam(
          _userId,
          ParamType.int,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'userLocation': serializeParam(
          _userLocation,
          ParamType.String,
        ),
        'userBookList': serializeParam(
          _userBookList,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        userId: deserializeParam(
          data['userId'],
          ParamType.int,
          false,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        userLocation: deserializeParam(
          data['userLocation'],
          ParamType.String,
          false,
        ),
        userBookList: deserializeStructParam<BookStruct>(
          data['userBookList'],
          ParamType.DataStruct,
          true,
          structBuilder: BookStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        userId == other.userId &&
        userName == other.userName &&
        userLocation == other.userLocation &&
        listEquality.equals(userBookList, other.userBookList);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([userId, userName, userLocation, userBookList]);
}

UserStruct createUserStruct({
  int? userId,
  String? userName,
  String? userLocation,
}) =>
    UserStruct(
      userId: userId,
      userName: userName,
      userLocation: userLocation,
    );
