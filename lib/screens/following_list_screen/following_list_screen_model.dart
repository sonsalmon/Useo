import '../../backend/schema/structs/user_struct.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';

class FollowingListScreenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isSearching = false;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UserStruct> userList = [];
  List<UserStruct> filteredUserList = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userList.add(UserStruct(
        userId: 0000,
        userName: '손정범',
        userLocation: 'userLocation',
        userProfileImage:
            'https://images.unsplash.com/photo-1497316730643-415fac54a2af?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=800&q=60'));
    userList.add(UserStruct(
        userId: 0001,
        userName: '손정인',
        userLocation: 'userLocation',
        userProfileImage:
            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2970&q=80'));
    userList.add(UserStruct(
        userId: 0003,
        userName: 'david',
        userLocation: 'userLocation',
        userProfileImage:
            'https://plus.unsplash.com/premium_photo-1675034393381-7e246fc40755?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3087&q=80'));
    userList.add(UserStruct(
        userId: 0004,
        userName: 'Yusuf',
        userLocation: 'userLocation',
        userProfileImage:
            'https://images.unsplash.com/photo-1526800544336-d04f0cbfd700?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3174&q=80'));
    userList.add(UserStruct(
        userId: 0005,
        userName: random_data.randomName(true, true),
        userLocation: 'userLocation',
        userProfileImage:
            'https://images.unsplash.com/photo-1526800544336-d04f0cbfd700?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3174&q=80'));

    filteredUserList = userList;
  }

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
