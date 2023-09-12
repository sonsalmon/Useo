import 'package:my_useo/backend/schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class FinishReadingScreen1Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  BookStruct? currentBook;
  late List<BookStruct> currentReadingBookList = [];

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    //api call : user의 현재 읽고 있는 책 받아오기
    currentReadingBookList.add(
      BookStruct(
        isbn: 0000,
        bookName: '벼랑 끝에 서는 용기',
        bookImage:
            'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788955364880.jpg',
        bookAuthor: '로렌 커닝햄',
        bookCategory: '1',
        bookSummery: '벼랑 끝에 서는 용기 줄거리',
      ),
    );
    currentReadingBookList.add(
      BookStruct(
        isbn: 0001,
        bookName: '도시와 그 불확실한 벽',
        bookImage:
            'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788954699075.jpg',
        bookAuthor: '무라카미 하루키',
        bookCategory: '1',
        bookSummery: '도시와 그 불확실한 벽 줄거리',
      ),
    );
  }

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
