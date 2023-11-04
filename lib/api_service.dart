import 'dart:convert';
import 'dart:ffi';

import 'package:my_useo/backend/schema/structs/index.dart';

import 'app_state.dart';
import 'screens/core_screen/home_screen/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String bookQueryUrl =
      'http://www.aladin.co.kr/ttb/api/ItemSearch.aspx';
  static const String aladinApiKey = 'ttbkey=ttbsjmjis02081525001';

  static const String baseUrl = 'http://127.0.0.1:8000';
  static const String users = 'users';
  static const String user = 'user';
  static const String login = 'login';
  static const String register = 'register';

  static const String books = 'books';
  static const String get_list = 'get_list';

  static final Map<String, String> http_headers = {
    'Authorization': 'Token ${FFAppState().loginToken}',
    'Content-Type': 'application/json', //보내는 형식
    'Accept': 'application/json', // 받는 형식
  };
  // 알라딘 API로 책 검색
  static Future<List<BookStruct>> getBookQuery(String query) async {
    // late List < BookStruct > bookListJson = [];
    final url = Uri.parse(
        '$bookQueryUrl?$aladinApiKey&Query=$query&QueryType=Keyword&MaxResults=15&start=1&SearchTarget=Book&output=JS&Version=20131101');
    http.Response response = await http.get(url, headers: http_headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);
      print('decoded data : ${decodedData['item']}');

      print(decodedData['item'].runtimeType);
      print((decodedData['item'] as List).runtimeType);
      // 목록의 각 항목을 BookStruct로 변환
      final List<BookStruct> books = (decodedData['item'] as List)
          .map((bookJson) =>
              BookStruct.fromAladin(bookJson as Map<String, dynamic>))
          .toList();
      print('books : ${books[0]}');

      return books;
    } else {
      throw Exception('책을 불러오는 데 실패했습니다');
    }
  }

  static Future<UserModel> getUserProfile({String? nickname}) async {
    // 유저 닉네임 파라미터를 주면 해당 닉네임을 가진 유저 검색, 없으면 token 소유 유저 정보 요청
    final url = (nickname != null && nickname.isNotEmpty)
        ? Uri.parse('$baseUrl/$users/$user/ ?nickname=$nickname')
        : Uri.parse('$baseUrl/$users/$user/');
    // final url = Uri.parse('$baseUrl/$users/$user/');
    http.Response response = await http.get(url, headers: http_headers);
    if (response.statusCode == 200) {
      final decodedData = utf8.decode(response.bodyBytes); //응답을 utf-8형식으로 디코딩
      UserModel model = UserModel.fromJson(json.decode(decodedData));
      return model;
    }
    throw Error();
  }

  //특정 유저의 독서 관계 리스트
  /*
  응답 형식
  {
    "book_data": {
      "isbn": "1234512345123",
      "title": "남한산성",
      "author": "author",
      "description": "description",
      "publisher": "publisher",
      "publish_date": "2023-10-22",
      "cover_image": "http://127.0.0.1:8000/media/books/cover/s212531446_1_kRxCi7L.jpg"
    },
    "nickname": "navid",
    "reading_state": "pause",
    "reading_duration": "00:23:01",
    "add_date": "2023-10-19",
    "rate": 3
  },
  
   */
  static Future<List<Map<String, dynamic>>> getUserBookList(
      {String? nickname}) async {
    final url = (nickname != null && nickname.isNotEmpty)
        ? Uri.parse('$baseUrl/$books/$get_list/ ?nickname=$nickname')
        : Uri.parse('$baseUrl/$books/$get_list/');
    http.Response response = await http.get(url, headers: http_headers);
    if (response.statusCode == 200) {
      final decodedData = utf8.decode(response.bodyBytes);

      List<Map<String, dynamic>> listOfMaps =
          json.decode(decodedData).cast<Map<String, dynamic>>();
      return listOfMaps;
    } else {
      throw Exception('책을 불러오는 데 실패했습니다');
    }
  }

  static Future<void> createOrUpdateReadingRelation(
      Map<String, dynamic> requestBody) async {}
}
