import 'dart:convert';
import 'dart:io';
// import 'dart:html';

import 'package:image_picker/image_picker.dart';
import 'package:my_useo/backend/schema/structs/index.dart';
import 'package:my_useo/position_process.dart';
import 'package:my_useo/screens/note_list_screen/note_list_screen_widget.dart';

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
  static const String search = 'search';
  static const String follow = 'follow';
  static const String following_list = 'following_list';
  static const String near_list = 'near_list';

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
        ? Uri.parse('$baseUrl/$users/$user/?nickname=$nickname')
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

  static Future<int> updateUserProfile({
    XFile? profileImage,
    String? nickname,
    String? profileMessage,
    double? latitude,
    double? longitude,
  }) async {
    final url = Uri.parse('$baseUrl/$users/$user/');
    var request = http.MultipartRequest('PATCH', url);
    request.headers.addAll(http_headers);
    if (profileImage != null) {
      request
        ..files.add(
          await http.MultipartFile.fromPath(
            'profile_image',
            profileImage.path,
            // contentType: MediaType('image', 'png'),
          ),
        );
    }
    if (nickname != null) {
      request..fields['nickname'] = nickname;
    }
    if (profileMessage != null) {
      request..fields['profile_message'] = profileMessage;
    }
    if (latitude != null) {
      request..fields['library_latitude'] = latitude.toString();
    }
    if (longitude != null) {
      request..fields['library_longitude'] = longitude.toString();
    }

    try {
      var response = await request.send();
      if (response.statusCode == 201) {
        print('업로드 성공');
      }
      if (response.statusCode == 206) {
        print('partial request 성공');
      }
      return response.statusCode;
    } catch (e) {
      print('Error occurred while sending post request: $e');
      return exitCode;
    }
  }

  static Future<List<UserStruct>> getUserListByKeyword(
      {required String keyword}) async {
    String encodedKeyword = Uri.encodeComponent(keyword); // 한글 쿼리파라미터 인코딩
    final url = Uri.parse('$baseUrl/$users/$search/?query=$encodedKeyword');

    http.Response response = await http.get(url, headers: http_headers);
    if (response.statusCode == 200) {
      final decodedData = json.decode(utf8.decode(response.bodyBytes));
      final List<UserStruct> resultUsers = (decodedData as List)
          .map((userJson) =>
              UserStruct.fromMap(userJson as Map<String, dynamic>))
          .toList();
      return resultUsers;
    } else {
      throw Exception('유저를 불러오는 데 실패했습니다.');
    }
  }

  // static Future<List<UserStruct>> getUserListByPosition() async{

  // }

  static Future<bool> followUser(
      {required String nickname, required bool wantToCheck}) async {
    /*
    checkFollowing == true : nickname 유저를 팔로잉 하고 있는지 확인 결과 t/f
    checkFollowing == false : nickname 유저를 실제로 팔로우 / 언 팔로우 토글 결과 t/f
     */
    String encodedNickname = Uri.encodeComponent(nickname); // 한글 쿼리파라미터 인코딩
    final url = Uri.parse(
        '$baseUrl/$users/$follow/?wantToCheck=$wantToCheck&&nickname=$encodedNickname');

    http.Response response = await http.get(url, headers: http_headers);
    if (response.statusCode == 200) {
      final decodedData = json.decode(utf8.decode(response.bodyBytes));
      final String followStr = decodedData['follow'];
      final bool follow = followStr.toLowerCase() == 'true';
      return follow;
    } else {
      throw Exception('팔로우 오류');
    }
  }

// 사용자가 팔로우 하고 있는 유저의 리스트
  static Future<List<UserStruct>> getUserFollowingList() async {
    final url = Uri.parse('$baseUrl/$users/$following_list/');

    http.Response response = await http.get(url, headers: http_headers);
    if (response.statusCode == 200) {
      final decodedData = json.decode(utf8.decode(response.bodyBytes));
      print(decodedData);
      final List<UserStruct> resultUsers = (decodedData as List)
          .map((userJson) =>
              UserStruct.fromMap(userJson as Map<String, dynamic>))
          .toList();
      print(resultUsers);
      return resultUsers;
    } else {
      throw Exception('유저를 불러오는 데 실패했습니다.');
    }
  }

  // 나와 가까운 유저의 리스트
  static Future<List<UserStruct>> getNearUserList() async {
    print('근처 유저 api 함수 내부 진입');
    final currentPosition =
        await PositionProcess.determinePosition(); //유저의 현재 위치
    final url = Uri.parse(
        '$baseUrl/$users/$near_list/?library_latitude=${currentPosition['latitude']}&&library_longitude=${currentPosition['longitude']}');

    http.Response response = await http.get(url, headers: http_headers);
    if (response.statusCode == 200) {
      final decodedData = json.decode(utf8.decode(response.bodyBytes));
      final List<UserStruct> resultUsers = (decodedData as List)
          .map((userJson) =>
              UserStruct.fromMap(userJson as Map<String, dynamic>))
          .toList();
      print('근처 유저 api 함수 완료');

      return resultUsers;
    } else {
      throw Exception('유저를 불러오는 데 실패했습니다.');
    }
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
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('책을 불러오는 데 실패했습니다.');
      // return null;
    }
    // return null;
  }
  //책 생성api

  static Future<int> createReadingRelation({
    required BookStruct bookData,
    required String readingState,
    String readingDuration = '00:00:00', //String 형
    double readingProgress = 0,
    // required DateTime add_date,
    double? rate,
  }) async {
    final url = Uri.parse('$baseUrl/$books/$create/');
    final body = json.encode({
      'book_data': bookData.toMap(),
      'reading_state': readingState,
      'reading_duration': readingDuration,
      'rate': rate,
    });
    try {
      http.Response response = await http.post(
        url,
        headers: http_headers,
        body: body,
      );
      if (response.statusCode == 201) {
        print('독서관계 생성 성공');
      } else if (response.statusCode == 500) {
        print('독서관계 저장 실패 : 중복');
        //??
      }
      return response.statusCode;
    } catch (e) {
      print('Error occurred while sending create request: $e');
      return 404;
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
  static Future<List<NoteStruct>> getNoteList(
      {String? isbn, required String nickname}) async {
    // final String nickname;
    // final String isbn;

    final url = (isbn == null)
        ? Uri.parse('$baseUrl/$notes/$list/?nickname=$nickname') // 유저의 모든 노트 조회
        : Uri.parse(
            '$baseUrl/$notes/$list/?nickname=$nickname&&isbn=$isbn'); // 특정 도서의 노트 조회
    http.Response response = await http.get(url, headers: http_headers);
    if (response.statusCode == 200) {
      final decodedData = json.decode(utf8.decode(response.bodyBytes));

      final List<NoteStruct> resultNotes = (decodedData as List)
          .map((noteJson) =>
              NoteStruct.fromMap(noteJson as Map<String, dynamic>))
          .toList();
      return resultNotes;
    } else {
      throw Exception('노트를 불러오는 데 실패했습니다');
    }
  }

  static void createNoteList({
    required List<String> noteList,
    required String isbn,
  }) async {
    final url = Uri.parse('$baseUrl/$notes/$list/');

    final requestContent = noteList
        .map((note) => {
              'book_isbn': isbn,
              'content': note,
            })
        .toList();

    final body = json.encode(requestContent);
    try {
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
}
