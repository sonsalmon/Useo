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
  static const String get_update_destroy = 'get_update_destroy';
  static const String create = 'create';

  static const String notes = 'notes';
  static const String list = 'list';

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
      // 목록의 각 항목을 BookStruct로 변환
      final List<BookStruct> books = (decodedData['item'] as List)
          .map((bookJson) =>
              BookStruct.fromAladin(bookJson as Map<String, dynamic>))
          .toList();

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
        ? Uri.parse('$baseUrl/$books/$get_list/?nickname=$nickname')
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

  //책 상세 조회 api
  static Future<Map<String, dynamic>?> getReadingRelation(
      // static Future<BookStruct?> getReadingRelation(
      String nickname,
      String isbn) async {
    final url =
        Uri.parse('$baseUrl/$books/$get_update_destroy/$nickname/$isbn/');
    try {
      http.Response response = await http.get(url, headers: http_headers);
      if (response.statusCode == 200) {
        final decodedData = utf8.decode(response.bodyBytes); //응답을 utf-8형식으로 디코딩
        // BookStruct model = BookStruct.fromMap(json.decode(decodedData));
        // return model;
        return json.decode(decodedData);
      } else if (response.statusCode == 404) {
        return null;
      }
    } catch (e) {
      throw Exception('책을 불러오는 데 실패했습니다.');
      print('책을 불러오는 데 실패했습니다:$e');
      // return null;
    }
    return null;
    // return null;
  }

  /* 독서관계 삭제 */
  static Future<bool> deleteReadingRelation(
      String nickname, String isbn) async {
    final url =
        Uri.parse('$baseUrl/$books/$get_update_destroy/$nickname/$isbn/');
    try {
      http.Response response = await http.delete(url, headers: http_headers);
      // if (response.statusCode == 200) {
      // BookStruct model = BookStruct.fromMap(json.decode(decodedData));
      // }
      if (response.statusCode == 204) {
        print('독서관계 삭제');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('책을 불러오는 데 실패했습니다.');
      print('책을 불러오는 데 실패했습니다:$e');
      // return null;
    }
    // return null;
  }
  //책 생성api

  static void createReadingRelation({
    required BookStruct bookData,
    required String readingState,
    required String readingDuration, //String 형
    required double readingProgress,
    // required DateTime add_date,
    Double? rate,
  }) async {
    final url = Uri.parse('$baseUrl/$books/$create/');
    final body = json.encode({
      'book_data': bookData.toMap(),
      'reading_state': readingState,
      'reading_duration': readingDuration,
      'rate': rate,
    });
    try {
      print('lets try');
      http.Response response = await http.post(
        url,
        headers: http_headers,
        body: body,
      );
      if (response.statusCode == 201) {}
    } catch (e) {
      print('Error occurred while sending delete request: $e');
      // return null;
    }
  }

  static void updateReadingRelation({
    required BookStruct bookData, //read_only
    String? readingState,
    String? readingDuration, //String 형
    double? readingProgress,
    // required DateTime add_date,
    double? rate,
  }) async {
    final url = Uri.parse(
        '$baseUrl/$books/$get_update_destroy/${FFAppState().signupnickname}/${bookData.isbn}/');
    final Map<String, dynamic> bodyMap = {
      // 'book_data'는 read_only라고 가정하고 여기에 포함하지 않음.
      if (readingState != null) 'reading_state': readingState,
      if (readingDuration != null) 'reading_duration': readingDuration,
      if (rate != null) 'rate': rate,
      // readingProgress는 double이므로, null이 아닐 때만 추가
      if (readingProgress != null) 'reading_progress': readingProgress,
    };
    final body = json.encode(bodyMap);
    try {
      print(body);
      http.Response response = await http.patch(
        url,
        headers: http_headers,
        body: body,
      );
      if (response.statusCode == 201) {}
    } catch (e) {
      print('Error occurred while sending post request: $e');
      // return null;
    }
  }

  /* 노트 리스트 조회 */
  static Future<List<Map<String, dynamic>>> getNoteList(
      {required String isbn, required String nickname}) async {
    // final String nickname;
    // final String isbn;

    final url = (nickname.isNotEmpty)
        ? Uri.parse('$baseUrl/$notes/$list/?nickname=$nickname&&isbn=$isbn')
        : Uri.parse(
            '$baseUrl/$list/$list/?nickname=${FFAppState().signupnickname}&&isbn=$isbn');
    http.Response response = await http.get(url, headers: http_headers);
    if (response.statusCode == 200) {
      final decodedData = utf8.decode(response.bodyBytes);

      List<Map<String, dynamic>> listOfMaps =
          json.decode(decodedData).cast<Map<String, dynamic>>();
      print('getbooklist api 결과 : $listOfMaps');
      return listOfMaps;
    } else {
      throw Exception('책을 불러오는 데 실패했습니다');
    }
  }
}
