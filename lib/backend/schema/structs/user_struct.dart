// ignore_for_file: unnecessary_getters_setters

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    int? id,
    String? nickname,
    String? profileMessage,
    String? profileImage,
    double? latitude,
    double? longitude,
  })  : _id = id,
        _nickname = nickname,
        _profileMessage = profileMessage,
        _profileImage = profileImage,
        _latitude = latitude;
  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementUserId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "nickname" field.
  String? _nickname;
  String get nickname => _nickname ?? '';
  set nickname(String? val) => _nickname = val;
  bool hasNickname() => _nickname != null;

  // "profileMessage" field.
  String? _profileMessage;
  String get profileMessage => _profileMessage ?? '';
  set profileMessage(String? val) => _profileMessage = val;
  bool hasProfileMessage() => _profileMessage != null;

  // "profileImage" field.
  String? _profileImage;
  String get profileImage => _profileImage ?? '';
  set userProfielImage(String? val) => _profileImage = val;
  bool hasProfileImage() => _profileImage != null;

  //
  double? _longitude;
  double get longitude => _longitude ?? 0;
  set longitude(double? val) => _longitude = val;
  bool hasLongitude() => _longitude != null;

  //
  double? _latitude;
  double get latitude => _latitude ?? 0;
  set latitude(double? val) => _latitude = val;
  bool hasLatitude() => _latitude != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        id: castToType<int>(data['id']),
        nickname: data['nickname'] as String?,
        profileMessage: data['profile_message'] as String?,
        profileImage: data['profile_image'] as String?,
        longitude: data['library_longitude'] as double?,
        latitude: data['library_latitude'] as double?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nickname': _nickname,
        'profileMessage': _profileMessage,
        'profileImage': _profileImage,
        'longitude': _longitude,
        'latitude': _latitude
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'nickname': serializeParam(
          _nickname,
          ParamType.String,
        ),
        'profileMessage': serializeParam(
          _profileMessage,
          ParamType.String,
        ),
        'profileImage': serializeParam(
          _profileImage,
          ParamType.String,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        nickname: deserializeParam(
          data['nickname'],
          ParamType.String,
          false,
        ),
        profileMessage: deserializeParam(
          data['profileMessage'],
          ParamType.String,
          false,
        ),
        profileImage: deserializeParam(
          data['profileImage'],
          ParamType.String,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.double,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        id == other.id &&
        nickname == other.nickname &&
        profileMessage == other.profileMessage &&
        profileImage == other.profileImage &&
        longitude == other.longitude &&
        latitude == other.latitude;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, nickname, profileMessage, profileImage, longitude, latitude]);
}

UserStruct createUserStruct({
  int? id,
  String? nickname,
  String? profileMessage,
  String? profileImage,
  double? longitude,
  double? latitude,
}) =>
    UserStruct(
      id: id,
      nickname: nickname,
      profileMessage: profileMessage,
      profileImage: profileImage,
      longitude: longitude,
      latitude: latitude,
    );
