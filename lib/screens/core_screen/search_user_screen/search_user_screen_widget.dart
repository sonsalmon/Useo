import 'package:my_useo/api_service.dart';
import 'package:my_useo/backend/schema/structs/index.dart';
import 'package:my_useo/constants.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:my_useo/position_process.dart';
import 'search_user_screen_model.dart';
export 'search_user_screen_model.dart';

class SearchUserScreenWidget extends StatefulWidget {
  const SearchUserScreenWidget({Key? key}) : super(key: key);

  @override
  _SearchUserScreenWidgetState createState() => _SearchUserScreenWidgetState();
}

class _SearchUserScreenWidgetState extends State<SearchUserScreenWidget> {
  late SearchUserScreenModel _model;
  Future<List<UserStruct>>? nearUserList;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchUserScreenModel());
    _model.textController ??= TextEditingController();
    // 프레임 렌더링 완료후 위치 업데이트 예약
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _model.updatePosition();

      setState(() {
        nearUserList = ApiService.getNearUserList();
      });
      // print('근처 유저 api 호출');
    });
    print('initState');
    // print('유저검색');
    // print(currentPosition);
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: GestureDetector(
          onTap: () {
            print('바깥 터치 -> unfocus');
            // if (!_model.isFocusnodeDIsposed) {
            //   setState(() {
            //     FocusScope.of(context).requestFocus(_model.unfocusNode);
            //   });
            // }
            _model.textfocus.unfocus();
            // setState(() {});
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _model.textController,
                        focusNode: _model.textfocus,
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
                            print('serch user setState 2');
                            _model.isSearching = true;
                            _model.filteredUserList = [];
                          });
                        },
                        onChanged: (value) {
                          if (_model.isSearching) {
                            if (_model.textController.text.isEmpty) {
                              setState(() {
                                print('serch user setState 3');
                                _model.filteredUserList = [];
                              });
                            } else {
                              EasyDebounce.debounce('user-list-query',
                                  Duration(milliseconds: 400), () {
                                //duration이 지나기 전에 검색 키워드를 비우면 전체 유저리스트 받아오는 현상 발견
                                //''빈 문자열을 쿼리파라미터로 넘기는 듯.
                                print('검색 키워드 : $value');
                                //빈문자열을 쿼리파라미터로 넘기지 않도록 한번 더 검사
                                if (_model.textController.text.isNotEmpty) {
                                  ApiService.getUserListByKeyword(
                                          keyword: _model.textController.text)
                                      .then((responseList) {
                                    setState(() {
                                      print('결과 리스트 : $responseList');
                                      _model.filteredUserList = responseList;
                                    });
                                  });
                                }
                              });
                            }
                          }
                        },
                        // onChanged: (value) {
                        //   print('내용 바뀌는 중');
                        // },
                        onSubmitted: (value) {
                          print('onFieldSubmitted called');
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
                                      print('serch user setState 5');

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
                            print('serch user setState 6');
                            _model.textfocus.unfocus();
                            // if (!_model.isFocusnodeDIsposed) {
                            //   FocusScope.of(context)
                            //       .requestFocus(_model.unfocusNode);
                            // }
                            _model.isSearching = !_model.isSearching;
                            if (!_model.isSearching) {
                              _model.textController?.clear();
                              _model.filteredUserList =
                                  _model.defaultNearUserList;
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
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                child: Text(
                  _model.isSearching
                      ? (_model.textController.text.isEmpty ? '' : '검색 결과')
                      : '내 주변 서재',
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: FutureBuilder(
                      future: nearUserList,
                      builder: (context, snapshot) {
                        // PositionProcess.determinePosition()
                        //     .then((userPosition) {
                        //   print(userPosition);
                        //   ApiService.updateUserProfile(
                        //       latitude: userPosition['latitude'],
                        //       longitude: userPosition['longitude']);
                        // });
                        if (snapshot.hasData) {
                          if (!_model.isSearching) {
                            _model.defaultNearUserList = snapshot.data!;
                            _model.filteredUserList =
                                _model.defaultNearUserList; // 근처 유저를 보여준다.
                            print('근처 유저 리스트: ${_model.filteredUserList}');
                          }

                          return ListView(
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
                                          Container(
                                            width: 40,
                                            height: 40,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: (user.profileImage.isEmpty)
                                                  ? Image.asset(
                                                      'assets/images/default_profile.jpeg',
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.network(
                                                      // '$baseUrl/${user.profileImage}',
                                                      '${user.profileImage}',
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              clipBehavior: Clip.hardEdge,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 8.0, 0.0),
                                                child: Column(
                                                  // mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${user.nickname}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      overflow:
                                                          TextOverflow.clip,
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '${user.profileMessage}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        softWrap: false,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () {
                                              context.pushNamed(
                                                  'LibraryOtherScreen',
                                                  queryParameters: {
                                                    'nickname': user.nickname,
                                                  });
                                              print('Button pressed ...');
                                            },
                                            text: 'View',
                                            options: FFButtonOptions(
                                              width: 70.0,
                                              height: 36.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
