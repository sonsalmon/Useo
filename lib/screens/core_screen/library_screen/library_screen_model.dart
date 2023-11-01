import 'package:my_useo/backend/schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class LibraryScreenModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isReading = false;

  bool isWanted = false;

  bool isPaused = false;

  bool isFinished = false;

  String? searchKeyword = '';

  bool isSearching = false;
  List<BookStruct> myLibrary = []; //api call 불러와야 함.
  List<BookStruct> filteredBookList = []; //api call 불러와야 함.

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Bottom Sheet - sortSheet] action in Text widget.
  // String? sortOption = '최근 추가순'; //defalt값을 어떻게?
  String sortOption = 'recent_add';

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.
  void sortBookList() {
    switch (sortOption) {
      case 'title':
        filteredBookList.sort((a, b) => a.title.compareTo(b.title));
      case 'title_reverse':
        filteredBookList.sort((a, b) => b.title.compareTo(a.title));
    }
  }

  void initState(BuildContext context) {}

  void dispose() {
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
