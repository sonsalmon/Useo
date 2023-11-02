import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class SignUpScreenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailAddress widget.
  TextEditingController? userNameController;
  String? Function(BuildContext, String?)? userNameControllerValidator =
      (BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return '아이디를 입력해주세요.';
    } else if (value.length < 4) {
      return '아이디는 4글자 이상 입력해주세요.';
    }
    // else if (아이디 중복 검사)
    return null;
  };
  // State field(s) for Password widget.
  TextEditingController? passwordController1;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? passwordController1Validator =
      (BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력해주세요.';
    }
    if (value.length < 6) {
      return '비밀번호는 6자 이상으로 설정해주세요.';
    }
    return null;
  };
  // State field(s) for Password widget.
  TextEditingController? passwordController2;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? passwordController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
  }

  void dispose() {
    unfocusNode.dispose();
    userNameController?.dispose();
    passwordController1?.dispose();
    passwordController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
