import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class SearchLibrarysheetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.
  Future<List<Map<String, dynamic>>>? searchLibraryResultList;

  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
