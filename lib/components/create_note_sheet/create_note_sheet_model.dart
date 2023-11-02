import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class CreateNoteSheetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for readingNote widget.
  TextEditingController? readingNoteController;
  String? Function(BuildContext, String?)? readingNoteControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    readingNoteController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
