import 'package:my_useo/api_service.dart';
import 'package:my_useo/backend/schema/structs/book_struct.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search_book_screen_model.dart';
export 'search_book_screen_model.dart';

class SearchBookScreenWidget extends StatefulWidget {
  SearchBookScreenWidget({
    Key? key,
    required this.nowReading,
  }) : super(key: key);
  final bool nowReading;
  bool startQuerying = false;

  @override
  _SearchBookWidgetState createState() => _SearchBookWidgetState();
}

class _SearchBookWidgetState extends State<SearchBookScreenWidget>
    with TickerProviderStateMixin {
  late SearchBookScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchBookScreenModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 48.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            '검색으로 책 추가하기',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                child: TextFormField(
                  //onChanged로 변경될 때마다 api 호출
                  controller: _model.textController,
                  keyboardType: TextInputType.text,

                  onFieldSubmitted: (value) {
                    if (value.isEmpty) return;
                    // _model.searchResultList = [];
                    _model.searchResultList = ApiService.getBookQuery(value);
                    widget.startQuerying = true;
                    setState(() {});
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: '책 제목, 작가명으로 검색',
                    labelStyle: FlutterFlowTheme.of(context).bodySmall,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  maxLines: null,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                    child: Text(
                      '검색 결과',
                      style: FlutterFlowTheme.of(context).bodySmall,
                    ),
                  ),
                  // Padding(
                  //   padding:
                  //       EdgeInsetsDirectional.fromSTEB(4.0, 12.0, 16.0, 0.0),
                  //   child: Text(
                  //     '24',
                  //     style: FlutterFlowTheme.of(context).bodySmall.override(
                  //           fontFamily: 'Readex Pro',
                  //           color: FlutterFlowTheme.of(context).primary,
                  //         ),
                  //   ),
                  // ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                  child: FutureBuilder(
                    future: _model.searchResultList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        widget.startQuerying = false;
                        print(snapshot.data);
                        print(snapshot.data.runtimeType);
                        return BookList(
                            searchResultList: snapshot.data!, widget: widget);
                      } else if (widget.startQuerying) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return SizedBox();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookList extends StatelessWidget {
  final List<BookStruct> searchResultList;
  const BookList({
    super.key,
    required this.searchResultList,
    required this.widget,
  });

  // final SearchBookScreenModel _model;
  final SearchBookScreenWidget widget;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      children: [
        for (var searchResultBook in searchResultList)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                widget.nowReading
                    ? context.pop(searchResultBook)
                    : context.pushReplacementNamed(
                        'bookDetailScreen',
                        queryParameters: {
                              'isbn':
                                  searchResultBook.isbn.toString(),
                              'bookName': searchResultBook.title,
                              'bookImage':
                                  searchResultBook.cover,
                              'bookAuthor':
                                  searchResultBook.author,
                              'bookSummery':
                                  searchResultBook.description,
                              'bookPublisher':
                                  searchResultBook.publisher,
                          // 'book': searchResultBook,
                          'inMyLibrary': false.toString(),
                        },
                      ); //DB에 책 등록
              },
              child: Container(
                width: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 0.0,
                      color: FlutterFlowTheme.of(context).lineColor,
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          '${searchResultBook.cover}',
                          width: 60.0,
                          height: 75.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                '${searchResultBook.title}',
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 4.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '${searchResultBook.author}',
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                '${searchResultBook.publisher}',
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 4.0, 4.0, 4.0),
                          child: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
