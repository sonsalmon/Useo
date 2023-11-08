// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NoteStruct extends BaseStruct {
  final int id;
  final int readingRelationId;
  NoteStruct({
    required this.id,
    required this.readingRelationId,
    String? content,
    DateTime? addDate,
    DateTime? lastModify,
  })  : _content = content,
        _addDate = addDate,
        _lastModify = lastModify;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;
  bool hasContent() => _content != null;

  // "addDate" field.
  DateTime? _addDate;
  DateTime? get addDate => _addDate;
  set addDate(DateTime? val) => _addDate = val;
  bool hasAddDate() => _addDate != null;
  // "lastModify" field.
  DateTime? _lastModify;
  DateTime? get lastModify => _addDate;
  set lastModify(DateTime? val) => _lastModify = val;
  bool hasLastModify() => _lastModify != null;

  static NoteStruct fromMap(Map<String, dynamic> data) => NoteStruct(
        id: data['id'] as int,
        readingRelationId: data['reading_relation'] as int,
        content: data['content'] as String?,
        addDate: DateTime.parse(data['add_date'] as String).toLocal(),
        lastModify: DateTime.parse(data['last_modify'] as String).toLocal(),
      );

  static NoteStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? NoteStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': this.id,
        'reading_relation': this.readingRelationId,
        'content': _content,
        'add_date': _addDate,
        'last_modify': _lastModify,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          this.id,
          ParamType.String,
        ),
        'reading_relation': serializeParam(
          this.readingRelationId,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'addDate': serializeParam(
          _addDate,
          ParamType.DateTime,
        ),
        'lastModify': serializeParam(
          _lastModify,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static NoteStruct fromSerializableMap(Map<String, dynamic> data) =>
      NoteStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        readingRelationId: deserializeParam(
          data['reading_relation'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        addDate: deserializeParam(
          data['add_date'],
          ParamType.DateTime,
          false,
        ),
        lastModify: deserializeParam(
          data['last_modify'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'NoteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NoteStruct &&
        id == other.id &&
        readingRelationId == other.readingRelationId &&
        content == other.content &&
        addDate == other.addDate &&
        lastModify == other.lastModify;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, readingRelationId, content, addDate, lastModify]);
}

NoteStruct createNoteStruct({
  required int id,
  required int readingRelationId,
  String? content,
  double? noteRating,
  String? noteReadingState,
  DateTime? addDate,
  DateTime? lastModify,
}) =>
    NoteStruct(
      id: id,
      readingRelationId: readingRelationId,
      content: content,
      addDate: addDate,
      lastModify: lastModify,
    );
