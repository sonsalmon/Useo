import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
