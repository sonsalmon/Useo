import 'package:flutter/scheduler.dart';
import 'package:my_useo/api_service.dart';
import 'package:my_useo/components/sort_sheet_widget.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_useo/constants.dart' as Constants;
import 'library_screen_model.dart';
export 'library_screen_model.dart';

class LibraryScreenWidget extends StatefulWidget {
  const LibraryScreenWidget({Key? key}) : super(key: key);

  @override
  _LibraryScreenWidgetState createState() => _LibraryScreenWidgetState();
}

class _LibraryScreenWidgetState extends State<LibraryScreenWidget> {
  late LibraryScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LibraryScreenModel());

    _model.textController ??= TextEditingController();
    _model.myLibraryList = ApiService.getUserBookList();
    _model.myLibraryList?.then((list) => {
          setState(() {
            //flitered 리스트를 서재 전체 도서로 초기화
            _model.filteredBookList = list;
          })
        });
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
      onTap: () {
        FocusScope.of(context).requestFocus(_model.unfocusNode);
        setState(() {
          _model.isSearching = false;
        });
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0.0,
                        color: FlutterFlowTheme.of(context).alternate,
                        offset: Offset(0.0, 1.0),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '나의 서재',
                              style: FlutterFlowTheme.of(context).headlineLarge,
                            ),
                            IconButton(
                              onPressed: () =>
                                  context.pushNamed('SettingScreen'),
                              icon: Icon(size: 30, Icons.settings_outlined),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController,
                                  autofocus: false,
                                  textInputAction: TextInputAction.search,
                                  obscureText: false,
                                  onTap: () {
                                    setState(() {
                                      _model.isSearching = true;
                                    });
                                  },
                                  onChanged: (value) async {
                                    if (_model.isSearching) {
                                      _model.myLibraryList?.then((list) {
                                        _model.filteredBookList = list
                                            .where((book) => book['book_data']
                                                    ['title']
                                                .toLowerCase()
                                                .contains(value.toLowerCase()))
                                            .toList();
                                        setState(() {});
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: '책 검색',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.isSearching = !_model.isSearching;
                                  if (!_model.isSearching) {
                                    _model.textController?.clear();
                                    _model.filteredBookList =
                                        await _model.myLibraryList!;
                                  }
                                  setState(() {});
                                },
                                child: Icon(_model.isSearching
                                    ? Icons.cancel
                                    : Icons.search),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //책 정렬
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.sort_outlined,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        final value = await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Wrap(children: [SortSheetWidget()]),
                            );
                          },
                        );
                        // ).then(
                        // (value) => setState(() => _model.sortOption = value));
                        setState(() {
                          _model.sortOption =
                              (value != null) ? value : _model.sortOption;
                          _model.sortBookList();
                        });
                      },
                      child: Text(
                        Constants.sortOptions[_model.sortOption]!,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 640.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    // child: BookList(model: _model),
                    child: FutureBuilder(
                      future: _model.myLibraryList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          // _model.loadLibraryList();
                          return BookList(
                            widget: widget,
                            resultList: _model.filteredBookList,
                            //BookList에서 호출하는 콜백함수
                            onItemChanged: () {
                              //책 리스트 다시 로드
                              _model.myLibraryList = ApiService.getUserBookList(
                                  nickname: FFAppState().signupnickname);
                              _model.myLibraryList?.then((list) {
                                setState(() {
                                  _model.filteredBookList = list;
                                });
                              });
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
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
  final Function() onItemChanged; //콜백함수
  const BookList({
    super.key,
    required this.widget,
    required this.resultList,
    required this.onItemChanged,
  });

  final LibraryScreenWidget widget;
  final List<Map<String, dynamic>> resultList;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.68,
      ),
      scrollDirection: Axis.vertical,
      children: [
        for (var libraryBook in resultList)
          InkWell(
            onTap: () {
              context.pushNamed(
                'bookDetailScreen',
                queryParameters: {
                  'isbn': libraryBook['book_data']['isbn'].toString(),
                  'inMyLibrary': 'true',
                },
              ).then((_) => onItemChanged()); //책 삭제했을 경우 도서 리스트 업데이트 되도록
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                '${libraryBook['book_data']['cover_image']}',
                width: 300.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
      ],
    );
  }
}
