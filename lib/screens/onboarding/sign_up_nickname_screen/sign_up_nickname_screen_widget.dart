import 'dart:convert';

import '../../../constants.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'sign_up_nickname_screen_model.dart';
export 'sign_up_nickname_screen_model.dart';

class SignUpUsernameScreenWidget extends StatefulWidget {
  const SignUpUsernameScreenWidget({Key? key}) : super(key: key);

  @override
  _SignUpUsernameScreenWidgetState createState() =>
      _SignUpUsernameScreenWidgetState();
}

class _SignUpUsernameScreenWidgetState
    extends State<SignUpUsernameScreenWidget> {
  late SignUpUsernameScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpUsernameScreenModel());
    print('회원가입 페이지');

    _model.nicknameController ??= TextEditingController();
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
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 670.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.4,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/Social_Distancing.png',
                        ).image,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0x00FFFFFF), Colors.white],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 64.0, 24.0, 24.0),
                        child: Text(
                          '우리의 서재\n우서',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    35.0, 12.0, 35.0, 12.0),
                                child: Text(
                                  '닉네임을 입력해주세요.',
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                              ),
                              Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          40.0, 24.0, 40.0, 12.0),
                                      child: TextFormField(
                                        controller: _model.nicknameController,
                                        textInputAction: TextInputAction.done,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'nickname',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDADADA),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xFFF9F9F9),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: _model
                                            .nicknameControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              40.0, 12.0, 40.0, 16.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(() {
                                FFAppState().signupnickname =
                                    _model.nicknameController.text;
                              });

                              final registerUrl =
                                  Uri.parse(baseUrl + 'users/register/');
                              http.Response response =
                                  await http.post(registerUrl, body: {
                                "username": FFAppState().signupUsername,
                                "password": FFAppState().signupPassword,
                                "password2": FFAppState().signupPassword,
                                "nickname": FFAppState().signupnickname,
                              });

                              // _model.emailAddressController.text, 비밀번호로 Auth 추가 필요
                              // api call
                              if (response.statusCode == 201) {
                                print('회원가입 성공');
                                print(
                                    '${FFAppState().signupUsername}, ${FFAppState().signupPassword}');
                                final loginUrl =
                                    Uri.parse(baseUrl + 'users/login/');
                                http.Response loginResponse = await http
                                    .post(loginUrl, body: {
                                  'username': FFAppState().signupUsername,
                                  'password': FFAppState().signupPassword
                                });

                                // _model.emailAddressController.text, 비밀번호로 Auth 추가 필요
                                // api call
                                if (loginResponse.statusCode == 200) {
                                  print(
                                      json.decode(loginResponse.body)['token']);
                                  setState(() {
                                    FFAppState().loginToken = json
                                        .decode(loginResponse.body)['token'];
                                    FFAppState().isSignedIn = true;
                                  });
                                  context.goNamed('HomeScreen');
                                } else if (loginResponse.statusCode == 400) {
                                  print('아이디 또는 비밀번호가 일치하지 않습니다.');
                                } else {
                                  print('로그인 실패');
                                }
                              } // api call
                              else {
                                print('회원가입 실패');
                              }
                              // AppState 이메일,비번,유저네임 값으로 회원가입
                              //로그인 필요
                            },
                            text: '회원 가입',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 60.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontWeight: FontWeight.bold,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                              hoverColor:
                                  FlutterFlowTheme.of(context).alternate,
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
        ),
      ),
    );
  }
}
