import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class LoginScreenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.
  // final String loginUrl = Uri.parse(baseUrl + 'users/login/');

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailAddress widget.
  TextEditingController? userNameController;
  String? Function(BuildContext, String?)? userNameControllerValidator;
  // State field(s) for Password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    userNameController?.dispose();
    passwordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
