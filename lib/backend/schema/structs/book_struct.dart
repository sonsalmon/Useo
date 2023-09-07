// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookStruct extends BaseStruct {
  BookStruct({
    int? isbn,
    String? bookName,
    String? bookAuthor,
    String? bookCategory,
    String? bookSummery,
    String? bookImage,
  })  : _isbn = isbn,
        _bookName = bookName,
        _bookAuthor = bookAuthor,
        _bookCategory = bookCategory,
        _bookSummery = bookSummery,
        _bookImage = bookImage;

  // "Isbn" field.
  int? _isbn;
  int get isbn => _isbn ?? 0;
  set isbn(int? val) => _isbn = val;
  void incrementIsbn(int amount) => _isbn = isbn + amount;
  bool hasIsbn() => _isbn != null;

  // "bookName" field.
  String? _bookName;
  String get bookName => _bookName ?? '';
  set bookName(String? val) => _bookName = val;
  bool hasBookName() => _bookName != null;

  // "bookAuthor" field.
  String? _bookAuthor;
  String get bookAuthor => _bookAuthor ?? '';
  set bookAuthor(String? val) => _bookAuthor = val;
  bool hasBookAuthor() => _bookAuthor != null;

  // "bookCategory" field.
  String? _bookCategory;
  String get bookCategory => _bookCategory ?? '';
  set bookCategory(String? val) => _bookCategory = val;
  bool hasBookCategory() => _bookCategory != null;

  // "bookSummery" field.
  String? _bookSummery;
  String get bookSummery => _bookSummery ?? '';
  set bookSummery(String? val) => _bookSummery = val;
  bool hasBookSummery() => _bookSummery != null;

  // "bookImage" field.
  String? _bookImage;
  String get bookImage => _bookImage ?? '';
  set bookImage(String? val) => _bookImage = val;
  bool hasBookImage() => _bookImage != null;

  static BookStruct fromMap(Map<String, dynamic> data) => BookStruct(
        isbn: castToType<int>(data['Isbn']),
        bookName: data['bookName'] as String?,
        bookAuthor: data['bookAuthor'] as String?,
        bookCategory: data['bookCategory'] as String?,
        bookSummery: data['bookSummery'] as String?,
        bookImage: data['bookImage'] as String?,
      );

  static BookStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? BookStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Isbn': _isbn,
        'bookName': _bookName,
        'bookAuthor': _bookAuthor,
        'bookCategory': _bookCategory,
        'bookSummery': _bookSummery,
        'bookImage': _bookImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Isbn': serializeParam(
          _isbn,
          ParamType.int,
        ),
        'bookName': serializeParam(
          _bookName,
          ParamType.String,
        ),
        'bookAuthor': serializeParam(
          _bookAuthor,
          ParamType.String,
        ),
        'bookCategory': serializeParam(
          _bookCategory,
          ParamType.String,
        ),
        'bookSummery': serializeParam(
          _bookSummery,
          ParamType.String,
        ),
        'bookImage': serializeParam(
          _bookImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static BookStruct fromSerializableMap(Map<String, dynamic> data) =>
      BookStruct(
        isbn: deserializeParam(
          data['Isbn'],
          ParamType.int,
          false,
        ),
        bookName: deserializeParam(
          data['bookName'],
          ParamType.String,
          false,
        ),
        bookAuthor: deserializeParam(
          data['bookAuthor'],
          ParamType.String,
          false,
        ),
        bookCategory: deserializeParam(
          data['bookCategory'],
          ParamType.String,
          false,
        ),
        bookSummery: deserializeParam(
          data['bookSummery'],
          ParamType.String,
          false,
        ),
        bookImage: deserializeParam(
          data['bookImage'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BookStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BookStruct &&
        isbn == other.isbn &&
        bookName == other.bookName &&
        bookAuthor == other.bookAuthor &&
        bookCategory == other.bookCategory &&
        bookSummery == other.bookSummery &&
        bookImage == other.bookImage;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([isbn, bookName, bookAuthor, bookCategory, bookSummery, bookImage]);
}

BookStruct createBookStruct({
  int? isbn,
  String? bookName,
  String? bookAuthor,
  String? bookCategory,
  String? bookSummery,
  String? bookImage,
}) =>
    BookStruct(
      isbn: isbn,
      bookName: bookName,
      bookAuthor: bookAuthor,
      bookCategory: bookCategory,
      bookSummery: bookSummery,
      bookImage: bookImage,
    );
