import 'dart:convert';

import 'app_state.dart';
import 'screens/core_screen/home_screen/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000';
  static const String users = 'users';
  static const String user = 'user';
  static const String login = 'login';
  static const String register = 'register';

  static Future<UserModel> getUserProfile({String? nickname}) async {
    // 유저 닉네임 파라미터를 주면 해당 닉네임을 가진 유저 검색, 없으면 token 소유 유저 정보 요청
    final url = (nickname != null && nickname.isNotEmpty)
        ? Uri.parse('$baseUrl/$users/$user/ ?nickname=$nickname')
        : Uri.parse('$baseUrl/$users/$user/');
    // final url = Uri.parse('$baseUrl/$users/$user/');
    http.Response response = await http.get(
      Uri.parse('$baseUrl/$users/$user/'),
      headers: {
        'Authorization': 'Token ${FFAppState().loginToken}',
        'Content-Type': 'application/json', //보내는 형식
        'Accept': 'application/json', // 받는 형식
      },
    );
    if (response.statusCode == 200) {
      final decodedData = utf8.decode(response.bodyBytes); //응답을 utf-8형식으로 디코딩
      UserModel model = UserModel.fromJson(json.decode(decodedData));
      return model;
    }
    throw Error();
  }
}
