import 'package:my_useo/api_service.dart';
import 'package:my_useo/backend/schema/structs/index.dart';
import 'package:my_useo/position_process.dart';

import '/flutter_flow/random_data_util.dart' as random_data;
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class SearchUserScreenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.
  //포커스 실험
  final textfocus = FocusNode();

  // final unfocusNode = FocusNode();

  bool _isFocusNodeDisposed = false;
  bool get isFocusnodeDIsposed => _isFocusNodeDisposed;

  bool isSearching = false;
  // State field(s) for TextField widget.
  String tempText = '';
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Future<List<UserStruct>>? userList;
  List<UserStruct> filteredUserList = [];
  List<UserStruct> defaultNearUserList = []; // 검색스크린 들어오면 가장 먼저 보이는 주변 서재 리스트

  /// Initialization and disposal methods.
  Future<void> updatePosition() async {
    try {
      await PositionProcess.determinePosition().then((currentPosition) {
        print(
            '위치 업데이트: ${currentPosition['latitude']}, ${currentPosition['longitude']}');
        ApiService.updateUserProfile(
          latitude: currentPosition['latitude'],
          longitude: currentPosition['longitude'],
        );
      });
    } catch (e) {
      print('위치 업데이트 오류 발생 : $e');
    }
    return;
  }

  void initState(BuildContext context) {
    filteredUserList = defaultNearUserList;
  }

  void dispose() {
    // unfocusNode.dispose();
    textfocus.dispose();
    _isFocusNodeDisposed = true;
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
