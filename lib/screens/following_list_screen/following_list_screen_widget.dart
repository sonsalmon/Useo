import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'following_list_screen_model.dart';
export 'following_list_screen_model.dart';

class FollowingListScreenWidget extends StatefulWidget {
  const FollowingListScreenWidget({Key? key}) : super(key: key);

  @override
  _FollowingListScreenWidgetState createState() =>
      _FollowingListScreenWidgetState();
}

class _FollowingListScreenWidgetState extends State<FollowingListScreenWidget> {
  late FollowingListScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FollowingListScreenModel());

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
          _model.filteredUserList = _model.userList;
        });
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () => context.safePop(),
                        child: Icon(
                          Icons.arrow_back,
                          size: 35,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _model.textController,
                        // onChanged: (value) => EasyDebounce.debounce(
                        //   '_model.textController',
                        //   Duration(milliseconds: 2000),
                        //   () => setState(() {}),
                        // ),
                        // chatgpt 코드
                        onTap: () {
                          //검색 텍스트 필드 클릭하면 검색상태로 진입
                          print('on tap textform field');
                          setState(() {
                            _model.isSearching = true;
                          });
                        },
                        onChanged: (value) {
                          print('내용 바뀌는 중');
                          if (_model.isSearching) {
                            if (_model.textController.text.isEmpty) {
                              setState(() {
                                _model.filteredUserList = [];
                              });
                            } else {
                              setState(() {
                                _model.filteredUserList = _model.userList
                                    .where((user) => user.userName
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList();
                              });
                            }
                          }
                        },

                        // autofocus: true,
                        // obscureText: false,
                        decoration: InputDecoration(
                          labelText: '이웃 서재 검색',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          suffixIcon: _model.isSearching
                              ? IconButton(
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    print('클리어텍스트');
                                    setState(() {
                                      _model.textController?.clear();
                                      _model.filteredUserList = [];
                                    });
                                  })
                              : null,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: IconButton(
                        icon: Icon(
                            _model.isSearching ? Icons.cancel : Icons.search),
                        onPressed: () {
                          print('아이콘 클릭');
                          setState(() {
                            _model.isSearching = !_model.isSearching;
                            if (!_model.isSearching) {
                              _model.textController?.clear();
                              _model.filteredUserList = _model.userList;
                            }
                          });
                        },
                      ),

                      // FlutterFlowIconButton(
                      //   borderColor: Colors.transparent,
                      //   borderRadius: 30.0,
                      //   borderWidth: 1.0,
                      //   buttonSize: 44.0,
                      //   icon: Icon(_model.isSearching?Icons.cancel_presentation_outlined :
                      //     Icons.search_rounded,
                      //     color: FlutterFlowTheme.of(context).primaryText,
                      //     size: 24.0,
                      //   ),
                      //   onPressed: () {

                      //   },
                      // ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 8.0),
                child: Text(
                  '팔로잉하는 서재',
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      for (var user in _model.filteredUserList)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 8.0),
                          child: Container(
                            width: double.infinity,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x32000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      '${user.userProfileImage}',
                                      width: 36.0,
                                      height: 36.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${user.userName}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Text(
                                                  '프로필 메시지',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () {
                                      context.pushNamed('LibraryOtherScreen',
                                          queryParameters: {
                                            'username': user.userName,
                                          });
                                      print('Button pressed ...');
                                    },
                                    text: 'View',
                                    options: FFButtonOptions(
                                      width: 70.0,
                                      height: 36.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
