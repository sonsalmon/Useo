// class HomeScreenModel extends FlutterFlowModel {
//   /// Initialization and disposal methods.

//   String userNickname;
//   String userProfileImage;
//   String userProfileMessage;

//   HomeScreenModel(
//     this.userNickname,
//     this.userProfileImage,
//     this.userProfileMessage,
//   );

//   void initState(BuildContext context) {}

//   void dispose() {}

//   /// Action blocks are added here.

//   /// Additional helper methods are added here.
// }

class UserModel {
  final String nickname, profileMessage;
  final String? profileImage;

  UserModel.fromJson(Map<String, dynamic> json)
      : nickname = json['nickname'],
        profileImage = json['profile_image'] as String?,
        profileMessage = json['profile_message'];
}
