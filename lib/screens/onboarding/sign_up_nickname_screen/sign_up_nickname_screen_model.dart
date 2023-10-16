import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class SignUpUsernameScreenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailAddress widget.
  TextEditingController? nicknameController;
  String? Function(BuildContext, String?)? nicknameControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nicknameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
