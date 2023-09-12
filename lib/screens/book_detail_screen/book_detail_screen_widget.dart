import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '/components/select_reading_state/select_reading_state_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_useo/constants.dart' as Constants;
import 'book_detail_screen_model.dart';
export 'book_detail_screen_model.dart';

class BookDetailScreenWidget extends StatefulWidget {
  const BookDetailScreenWidget({
    Key? key,
    required this.isbn,
    required this.bookName,
    required this.bookImage,
    required this.bookAuthor,
    required this.bookCategory,
    required this.bookSummery,
    required this.bookPublisher,
    required this.inMyLibrary,
  }) : super(key: key);
  final int isbn;
  final String bookName;
  final String bookImage;
  final String bookAuthor;
  final String bookCategory;
  final String bookSummery;
  final String bookPublisher;

  final bool inMyLibrary;

  @override
  _BookDetailScreenWidgetState createState() => _BookDetailScreenWidgetState();
}

class _BookDetailScreenWidgetState extends State<BookDetailScreenWidget> {
  late BookDetailScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookDetailScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => context.safePop(),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30,
                    ),
                  ),
                  if (widget.inMyLibrary)
                    InkWell(
                      onTap: () {}, //내 서재에서 삭제
                      child: Icon(
                        Icons.delete_outline,
                        color: FlutterFlowTheme.of(context).error,
                        size: 30,
                      ),
                    ),
                  if (!widget.inMyLibrary)
                    InkWell(
                      onTap: () {}, //내 서재에 추가
                      child: Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30,
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 500),
                              fadeOutDuration: Duration(milliseconds: 500),
                              imageUrl: '${widget.bookImage}',
                              width: 160.0,
                              height: 250.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                      child: Text(
                        '${widget.bookName}',
                        style: FlutterFlowTheme.of(context).headlineMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                      child: Text(
                        '${widget.bookAuthor}',
                        style: FlutterFlowTheme.of(context).labelMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                      child: Text(
                        '${widget.bookPublisher}',
                        style: FlutterFlowTheme.of(context).labelMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          // 가져온 걸로 업데이트
                          //
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: SelectReadingStateWidget(),
                              );
                            },
                          ).then((value) =>
                              setState(() => _model.readingState = value));

                          setState(() {});
                        },
                        child: Text(
                          Constants.readingState[_model.readingState] ??
                              '독서 상태',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ),
                    ),
                    if (_model.readingState == 'finish')
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 0, 0),
                        child: RatingBar.builder(
                          onRatingUpdate: (newValue) =>
                              setState(() => _model.ratingBarValue = newValue),
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rounded,
                            color: FlutterFlowTheme.of(context).tertiary,
                          ),
                          direction: Axis.horizontal,
                          initialRating: _model.ratingBarValue ??= 3,
                          unratedColor: FlutterFlowTheme.of(context).accent3,
                          itemCount: 5,
                          itemSize: 30,
                          glowColor: FlutterFlowTheme.of(context).tertiary,
                        ),
                      ),
                    Divider(
                      height: 36.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 52.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          for (int i = 0; i < 3; i++)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 8.0),
                              child: Container(
                                width: double.infinity,
                                // height: 150.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Color(0x411D2429),
                                      offset: Offset(0.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.chevron_right_rounded,
                                            color: Color(0xFF57636C),
                                            size: 28.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      child: Text(
                                        'Escape to the serene beauty of the mountains and enjoy a luxurious stay in our cozy mountain house, the perfect destination for your dream mountain getaway.',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 8.0, 8.0),
                                      child: Text(
                                        '날짜',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
