import '../../backend/schema/structs/book_struct.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class SearchBookScreenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  Future<List<BookStruct>>? searchResultList;
  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
