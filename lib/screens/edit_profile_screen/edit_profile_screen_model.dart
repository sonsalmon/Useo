import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_useo/api_service.dart';
import 'package:my_useo/backend/schema/structs/index.dart';
import 'package:my_useo/flutter_flow/flutter_flow_model.dart';
import 'package:my_useo/screens/core_screen/home_screen/user_model.dart';

class EditProfileScreenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  // FFUploadedFile uploadedLocalFile =
  //     FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  Future<XFile?>? tempProfileImage;
  XFile? newProfileImage;
  Future<UserModel> currentUserProfile = ApiService.getUserProfile();

  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    return null;

    // if (val == null || val.isEmpty) {
    //   return 'Email address is required.';
    // }

    // return null;
  }

  // State field(s) for Switch widget.
  bool? switchValue;

  Future<XFile?> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // 갤러리에서 이미지를 선택합니다.
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textController2Validator = _textController2Validator;
  }

  void dispose() {
    unfocusNode.dispose();
    textController1?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
