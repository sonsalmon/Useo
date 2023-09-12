import 'package:my_useo/backend/schema/structs/index.dart';

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

  List<BookStruct> myLibrary = []; //api call 불러와야 함.
  

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Bottom Sheet - sortSheet] action in Text widget.
  // String? sortOption = '최근 추가순'; //defalt값을 어떻게?
  String sortOption = Constants.sortOptions['recent_add']!;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    myLibrary.add(
      BookStruct(
          isbn: 0000,
          bookName: '벼랑 끝에 서는 용기',
          bookImage:
              'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788955364880.jpg',
          bookAuthor: '로렌 커닝햄',
          bookCategory: '1',
          bookSummery: '벼랑 끝에 서는 용기 줄거리',
          bookPublisher: '예수전도단'),
    );
    myLibrary.add(
      BookStruct(
          isbn: 0001,
          bookName: '도시와 그 불확실한 벽',
          bookImage:
              'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788954699075.jpg',
          bookAuthor: '무라카미 하루키',
          bookCategory: '1',
          bookSummery: '도시와 그 불확실한 벽 줄거리',
          bookPublisher: '멋진 출판사'),
    );
    myLibrary.add(
      BookStruct(
          isbn: 0002,
          bookName: '룩 백',
          bookImage:
              'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791168761841.jpg',
          bookAuthor: 'Tatsuki Fujimoto',
          bookCategory: '2',
          bookSummery: '룩백 줄거리',
          bookPublisher: '멋진 출판사'),
    );
  }

  void dispose() {
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
