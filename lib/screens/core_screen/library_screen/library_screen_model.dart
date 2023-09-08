import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:my_useo/constants.dart' as Constants;

class LibraryScreenModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isReading = false;

  bool isWanted = false;

  bool isPaused = false;

  bool isFinished = false;

  String? searchKeyword = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Bottom Sheet - sortSheet] action in Text widget.
  // String? sortOption = '최근 추가순'; //defalt값을 어떻게?
  String sortOption = Constants.sortOptions['recent_add']!;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
