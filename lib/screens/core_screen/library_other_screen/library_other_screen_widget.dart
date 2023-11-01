import 'package:my_useo/components/sort_sheet_widget.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_useo/constants.dart' as Constants;
import 'library_other_screen_model.dart';
export 'library_other_screen_model.dart';

class LibraryOtherScreenWidget extends StatefulWidget {
  const LibraryOtherScreenWidget({
    Key? key,
    required this.username,
  }) : super(key: key);
  final String username;

  @override
  _LibraryScreenWidgetState createState() => _LibraryScreenWidgetState();
}

class _LibraryScreenWidgetState extends State<LibraryOtherScreenWidget> {
  late LibraryOtherScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LibraryOtherScreenModel());

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
      onTap: () {
        print('바깥 터치 -> unfocus');
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
                            InkWell(
                              onTap: () => context.safePop(),
                              child: Icon(
                                Icons.arrow_back,
                                size: 35,
                              ),
                            ),
                            Text(
                              '${widget.username}의 서재',
                              style: FlutterFlowTheme.of(context).headlineLarge,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _model.following = !_model.following;
                                    //api call 팔로잉 / 팔로잉 취소
                                  });
                                },
                                child: Icon(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 35,
                                  _model.following
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                ),
                              ),
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
                                  onChanged: (value) {
                                    print(_model.filteredBookList);
                                    if (_model.isSearching) {
                                      setState(() {
                                        _model.filteredBookList = _model
                                            .myLibrary
                                            .where((book) => book.title
                                                .toLowerCase()
                                                .contains(value.toLowerCase()))
                                            .toList();
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
                                  setState(() {
                                    _model.isSearching = !_model.isSearching;
                                    if (!_model.isSearching) {
                                      _model.textController?.clear();
                                      _model.filteredBookList =
                                          _model.myLibrary;
                                    }
                                  });
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
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.68,
                      ),
                      scrollDirection: Axis.vertical,
                      children: [
                        for (var libraryBook in _model.filteredBookList)
                          InkWell(
                            onTap: () => context.pushNamed('bookDetailScreen',
                                // queryParameters: {
                                //   'isbn': libraryBook.isbn.toString(),
                                //   'bookName': libraryBook.bookName,
                                //   'bookImage': libraryBook.bookImage,
                                //   'bookAuthor': libraryBook.bookAuthor,
                                //   'bookCategory': libraryBook.bookCategory,
                                //   'bookSummery': libraryBook.bookSummery,
                                //   'bookPublisher': libraryBook.bookPublisher,
                                //   'inMyLibrary': 'false',
                                // },
                                ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                '${libraryBook.cover}',
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      ],
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
