import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';

class BookDetailScreenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Bottom Sheet - selectReadingState] action in optionTitle widget.
  String? readingState;
  // State field(s) for amentities widget.
  String? amentitiesValue;
  FormFieldController<List<String>>? amentitiesValueController;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;

  double get ratingBarValue => 3;

  set ratingBarValue(double ratingBarValue) {
    //onchange : api call db에 업데이트
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
