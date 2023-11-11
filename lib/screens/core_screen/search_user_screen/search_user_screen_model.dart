import 'package:my_useo/backend/schema/structs/index.dart';

import '/flutter_flow/random_data_util.dart' as random_data;
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class SearchUserScreenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isSearching = false;
  // State field(s) for TextField widget.
  String tempText = '';
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Future<List<UserStruct>>? userList;
  List<UserStruct> filteredUserList = [];
  List<UserStruct> defaultNearUserList = []; // 검색스크린 들어오면 가장 먼저 보이는 주변 서재 리스트

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    filteredUserList = defaultNearUserList;
  }

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
