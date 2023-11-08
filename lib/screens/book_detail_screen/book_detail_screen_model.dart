import 'package:my_useo/api_service.dart';
import 'package:my_useo/backend/schema/structs/index.dart';
import 'package:my_useo/constants.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';

class BookDetailScreenModel extends FlutterFlowModel {
  BookDetailScreenModel(
      {required this.book,
      required this.noteList,
      required this.readingDuration,
      required this.readingProgress,
      required String readingState,
      double? initialRating})
      : _ratingBarValue = initialRating ?? 3,
        _readingState = readingState;

  double? _ratingBarValue;
  String _readingState;

  ///  State fields for stateful widgets in this page.

  BookStruct book;
  List<NoteStruct> noteList;

  // Stores action output result for [Bottom Sheet - selectReadingState] action in optionTitle widget.
  double readingProgress;
  String readingDuration;
  // State field(s) for amentities widget.
  String? amentitiesValue;
  FormFieldController<List<String>>? amentitiesValueController;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;

  double? get ratingBarValue => _ratingBarValue; //ratingBarValue ?? 3;

  set ratingBarValue(double? newValue) {
    if (_ratingBarValue != newValue) {
      _ratingBarValue = newValue;
      ApiService.updateReadingRelation(bookData: book, rate: _ratingBarValue);
    }
    //onchange : api call db에 업데이트
  }

  String get readingState => _readingState; //ratingBarValue ?? 3;

  set readingState(String newValue) {
    //reading state 수정되면 db call
    if (_readingState != newValue) {
      _readingState = newValue;
      ApiService.updateReadingRelation(
          bookData: book, readingState: _readingState);
    }
    //onchange : api call db에 업데이트
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
