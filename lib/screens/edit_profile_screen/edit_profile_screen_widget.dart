import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_useo/api_service.dart';
import 'package:my_useo/screens/core_screen/home_screen/user_model.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'edit_profile_screen_model.dart';

class EditProfileScreenWidget extends StatefulWidget {
  const EditProfileScreenWidget({Key? key}) : super(key: key);

  @override
  _EditProfileScreenWidgetState createState() =>
      _EditProfileScreenWidgetState();
}

class _EditProfileScreenWidgetState extends State<EditProfileScreenWidget> {
  late EditProfileScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().tempProfilePic =
            'https://i.pinimg.com/564x/1e/ff/23/1eff23ffa1774d294af00a47461443cc.jpg';
      });
    });

    // _model.textController1 ??=
    //     TextEditingController(text: 'currentUserDisplayName');
    // _model.textController2 ??= TextEditingController(text: 'currentUserEmail');
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder(
        future: ApiService.getUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserModel currentUser = snapshot.data!;
            _model.textController1 =
                TextEditingController(text: currentUser.nickname);
            _model.textController2 =
                TextEditingController(text: currentUser.profileMessage);
            return GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                appBar: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  automaticallyImplyLeading: false,
                  leading: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pop();
                          },
                          child: Text(
                            'Cancel',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter',
                                  // color: FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  title: Text(
                    '프로필 수정',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 20,
                        ),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // StreamBuilder<List<AdministrativeRecord>>(
                          //   stream: queryAdministrativeRecord(
                          //     singleRecord: true,
                          //   ),
                          Builder(
                            builder: (context) {
                              // Customize what your widget looks like when it's loading.
                              // if (!snapshot.hasData) {
                              //   return Center(
                              //     child: SizedBox(
                              //       width: 12,
                              //       height: 12,
                              //       child: CircularProgressIndicator(
                              //         valueColor: AlwaysStoppedAnimation<Color>(
                              //           Colors.white,
                              //         ),
                              //       ),
                              //     ),
                              //   );
                              // }
                              // List<AdministrativeRecord> textAdministrativeRecordList =
                              //     snapshot.data!;
                              // final textAdministrativeRecord =
                              //     textAdministrativeRecordList.isNotEmpty
                              //         ? textAdministrativeRecordList.first
                              //         : null;
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await ApiService.updateUserProfile(
                                    nickname: _model.textController1.text,
                                    profileMessage: _model.textController2.text,
                                    profileImage: _model.newProfileImage,
                                  );
                                  // if (_model.formKey.currentState == null ||
                                  //     !_model.formKey.currentState!.validate()) {
                                  //   return;
                                  // }

                                  // await currentUserReference!
                                  //     .update(createUsersRecordData(
                                  //   displayName: _model.textController1.text,
                                  //   photoUrl: FFAppState().tempProfilePic,
                                  //   bio: _model.textController3.text,
                                  //   website: _model.textController4.text,
                                  //   enableEmail: _model.switchValue,
                                  //   email: _model.textController2.text,
                                  // ));

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '프로필 저장 완료!',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).success,
                                    ),
                                  );
                                  context.pop();
                                },
                                child: Text(
                                  'Done',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                  centerTitle: true,
                  elevation: 0,
                ),
                body: SafeArea(
                  top: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 0.5,
                        decoration: BoxDecoration(
                          color: Color(0xFFDADADA),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                // onTap: () async {
                                //   final selectedMedia = await selectMedia(
                                //     mediaSource: MediaSource.photoGallery,
                                //     multiImage: false,
                                //   );
                                //   if (selectedMedia != null &&
                                //       selectedMedia.every((m) =>
                                //           validateFileFormat(m.storagePath, context))) {
                                //     setState(() => _model.isDataUploading = true);
                                //     var selectedUploadedFiles = <FFUploadedFile>[];

                                //     var downloadUrls = <String>[];
                                //     try {
                                //       showUploadMessage(
                                //         context,
                                //         'Uploading file...',
                                //         showLoading: true,
                                //       );
                                //       selectedUploadedFiles = selectedMedia
                                //           .map((m) => FFUploadedFile(
                                //                 name: m.storagePath.split('/').last,
                                //                 bytes: m.bytes,
                                //                 height: m.dimensions?.height,
                                //                 width: m.dimensions?.width,
                                //                 blurHash: m.blurHash,
                                //               ))
                                //           .toList();

                                //       downloadUrls = (await Future.wait(
                                //         selectedMedia.map(
                                //           (m) async =>
                                //               await uploadData(m.storagePath, m.bytes),
                                //         ),
                                //       ))
                                //           .where((u) => u != null)
                                //           .map((u) => u!)
                                //           .toList();
                                //     } finally {
                                //       ScaffoldMessenger.of(context)
                                //           .hideCurrentSnackBar();
                                //       _model.isDataUploading = false;
                                //     }
                                //     if (selectedUploadedFiles.length ==
                                //             selectedMedia.length &&
                                //         downloadUrls.length == selectedMedia.length) {
                                //       setState(() {
                                //         _model.uploadedLocalFile =
                                //             selectedUploadedFiles.first;
                                //         _model.uploadedFileUrl = downloadUrls.first;
                                //       });
                                //       showUploadMessage(context, 'Success!');
                                //     } else {
                                //       setState(() {});
                                //       showUploadMessage(
                                //           context, 'Failed to upload data');
                                //       return;
                                //     }
                                //   }

                                //   if (_model.uploadedFileUrl != '') {
                                //     FFAppState().update(() {
                                //       FFAppState().tempProfilePic =
                                //           _model.uploadedFileUrl;
                                //     });
                                //   }
                                // },
                                onTap: () async {
                                  print('사진 선택중');
                                  setState(() {
                                    _model.tempProfileImage =
                                        _model.pickImage();
                                  });
                                  // _model.tempProfileImage = await picker.pickImage(source: source);
                                  print('사진 선택후');
                                  // _model.tempProfileImage?.then((_) => setState(() {}));
                                },
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: FutureBuilder(
                                      future: _model.tempProfileImage,
                                      builder: (context, snapshot) {
                                        print('future builder 임');
                                        if (snapshot.hasData) {
                                          _model.newProfileImage =
                                              snapshot.data;
                                          if (_model.newProfileImage != null) {
                                            return Image.file(
                                                File(_model
                                                    .newProfileImage!.path),
                                                fit: BoxFit.cover);
                                          } else {
                                            print('else 1');
                                            return Image.network(
                                              currentUser.profileImage!,
                                              fit: BoxFit.cover,
                                            );
                                          }
                                        } else {
                                          print('else 2');
                                          return Image.network(
                                              currentUser.profileImage!);
                                        }
                                        // child: (true)
                                        // // : Image.file(FFAppState().tempProfilePic,fit: BoxFit.cover,),
                                        // : Image.file(
                                        //     File(image.path),
                                        //     fit: BoxFit.cover,
                                        //   ),
                                      }),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 15, 15),
                            child: InkWell(
                              onTap: () async {
                                setState(() {
                                  _model.tempProfileImage = _model.pickImage();
                                });
                              },
                              child: Text(
                                'Edit picture',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.5,
                        decoration: BoxDecoration(
                          color: Color(0xFFDADADA),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 15, 6),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      '닉네임',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    // child: AuthUserStreamWidget(
                                    //   builder: (context) => TextFormField(
                                    child: TextFormField(
                                      controller: _model.textController1,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText: '변경할 닉네임 입력',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      // validator: _model.textController1Validator
                                      //     .asValidator(context),
                                    ),
                                  ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.5,
                        decoration: BoxDecoration(
                          color: Color(0xFFDADADA),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 15, 6),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      '프로필 메시지',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Form(
                                      key: _model.formKey,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: TextFormField(
                                        controller: _model.textController2,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          hintText: '변경할 프로필 메시지 입력',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: _model
                                            .textController2Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 0.5,
                              decoration: BoxDecoration(
                                color: Color(0xFFDADADA),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
