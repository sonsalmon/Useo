// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookStruct extends BaseStruct {
  BookStruct({
    String? isbn,
    String? title,
    String? author,
    // String? categoryName,
    String? description,
    String? cover,
    String? publisher,
  })  : _isbn = isbn,
        _title = title,
        _author = author,
        // _categoryName = categoryName,
        _description = description,
        _cover = cover,
        _publisher = publisher;

  // "Isbn" field.
  String? _isbn;
  String get isbn => _isbn ?? '';
  set isbn(String? val) => _isbn = val;
  // void incrementIsbn(int amount) => _isbn = isbn + amount;
  bool hasIsbn() => _isbn != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  set author(String? val) => _author = val;
  bool hasAuthor() => _author != null;

  // "categoryName" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  set categoryName(String? val) => _categoryName = val;
  bool hasCategoryName() => _categoryName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasdescription() => _description != null;

  // "cover" field.
  String? _cover;
  String get cover => _cover ?? '';
  set cover(String? val) => _cover = val;
  bool hasCover() => _cover != null;

  // "publisher" field.
  String? _publisher;
  String get publisher => _publisher ?? '';
  set publisher(String? val) => _publisher = val;
  bool hasPublisher() => _publisher != null;

  static BookStruct fromAladin(Map<String, dynamic> data) => BookStruct(
        isbn: data['isbn13'],
        title: data['title'] as String?,
        author: data['author'] as String?,
        // categoryName: data['categoryName'] as String?,
        description: data['description'] as String?,
        cover: data['cover'] as String?,
        publisher: data['publisher'] as String?,
      );
  static BookStruct fromMap(Map<String, dynamic> data) => BookStruct(
        isbn: data['isbn'],
        title: data['title'] as String?,
        author: data['author'] as String?,
        // categoryName: data['categoryName'] as String?,
        description: data['description'] as String?,
        cover: data['cover_image'] as String?,
        publisher: data['publisher'] as String?,
      );

  static BookStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? BookStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'isbn': _isbn,
        'title': _title,
        'author': _author,
        'categoryName': _categoryName,
        'description': _description,
        'cover': _cover,
        'publisher': _publisher,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isbn': serializeParam(
          _isbn,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'author': serializeParam(
          _author,
          ParamType.String,
        ),
        'categoryName': serializeParam(
          _categoryName,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'cover': serializeParam(
          _cover,
          ParamType.String,
        ),
        'publisher': serializeParam(
          _publisher,
          ParamType.String,
        ),
      }.withoutNulls;

  static BookStruct fromSerializableMap(Map<String, dynamic> data) =>
      BookStruct(
        isbn: deserializeParam(
          data['isbn'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        author: deserializeParam(
          data['author'],
          ParamType.String,
          false,
        ),
        // categoryName: deserializeParam(
        //   data['categoryName'],
        //   ParamType.String,
        //   false,
        // ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        cover: deserializeParam(
          data['cover'],
          ParamType.String,
          false,
        ),
        publisher: deserializeParam(
          data['publisher'],
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
        title == other.title &&
        author == other.author &&
        categoryName == other.categoryName &&
        description == other.description &&
        cover == other.cover &&
        publisher == other.publisher;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([isbn, title, author, categoryName, description, cover, publisher]);
}

BookStruct createBookStruct({
  String? isbn,
  String? title,
  String? author,
  // String? categoryName,
  String? description,
  String? cover,
  String? publisher,
}) =>
    BookStruct(
      isbn: isbn,
      title: title,
      author: author,
      // categoryName: categoryName,
      description: description,
      cover: cover,
      publisher: publisher,
    );
