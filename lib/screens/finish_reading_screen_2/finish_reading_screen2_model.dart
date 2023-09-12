import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class FinishReadingScreen2Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  int readingPage = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Bottom Sheet - selectReadingProgress] action in Container widget.
  double? readingProgress;
  // Stores action output result for [Bottom Sheet - selectReadingState] action in Container widget.
  String? readingStateKey;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
