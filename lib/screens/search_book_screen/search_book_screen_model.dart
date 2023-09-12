import '../../backend/schema/structs/book_struct.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class SearchBookScreenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  late List<BookStruct> searchResultList = [];
  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchResultList.add(
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
    searchResultList.add(
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
  }

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
