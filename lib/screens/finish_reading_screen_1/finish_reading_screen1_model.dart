import 'package:my_useo/backend/schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class FinishReadingScreen1Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  BookStruct? currentBook;
  late List<BookStruct> currentReadingBookList = [];

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    //api call : user의 현재 읽고 있는 책 받아오기
  }

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
