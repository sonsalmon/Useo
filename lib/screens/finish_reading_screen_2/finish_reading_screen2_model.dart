import '/components/select_reading_progress/select_reading_progress_widget.dart';
import '/components/select_reading_state/select_reading_state_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class FinishReadingScreen2Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  int readingPage = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Bottom Sheet - selectReadingProgress] action in Container widget.
  double? readingProgress;
  // Stores action output result for [Bottom Sheet - selectReadingState] action in Container widget.
  String? readingState;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
