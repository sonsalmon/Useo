// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NoteStruct extends BaseStruct {
  NoteStruct({
    String? noteText,
    double? noteRating,
    String? noteReadingState,
    DateTime? noteStartRead,
  })  : _noteText = noteText,
        _noteRating = noteRating,
        _noteReadingState = noteReadingState,
        _noteStartRead = noteStartRead;

  // "noteText" field.
  String? _noteText;
  String get noteText => _noteText ?? '';
  set noteText(String? val) => _noteText = val;
  bool hasNoteText() => _noteText != null;

  // "noteRating" field.
  double? _noteRating;
  double get noteRating => _noteRating ?? 0.0;
  set noteRating(double? val) => _noteRating = val;
  void incrementNoteRating(double amount) => _noteRating = noteRating + amount;
  bool hasNoteRating() => _noteRating != null;

  // "noteReadingState" field.
  String? _noteReadingState;
  String get noteReadingState => _noteReadingState ?? '';
  set noteReadingState(String? val) => _noteReadingState = val;
  bool hasNoteReadingState() => _noteReadingState != null;

  // "noteStartRead" field.
  DateTime? _noteStartRead;
  DateTime? get noteStartRead => _noteStartRead;
  set noteStartRead(DateTime? val) => _noteStartRead = val;
  bool hasNoteStartRead() => _noteStartRead != null;

  static NoteStruct fromMap(Map<String, dynamic> data) => NoteStruct(
        noteText: data['noteText'] as String?,
        noteRating: castToType<double>(data['noteRating']),
        noteReadingState: data['noteReadingState'] as String?,
        noteStartRead: data['noteStartRead'] as DateTime?,
      );

  static NoteStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? NoteStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'noteText': _noteText,
        'noteRating': _noteRating,
        'noteReadingState': _noteReadingState,
        'noteStartRead': _noteStartRead,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'noteText': serializeParam(
          _noteText,
          ParamType.String,
        ),
        'noteRating': serializeParam(
          _noteRating,
          ParamType.double,
        ),
        'noteReadingState': serializeParam(
          _noteReadingState,
          ParamType.String,
        ),
        'noteStartRead': serializeParam(
          _noteStartRead,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static NoteStruct fromSerializableMap(Map<String, dynamic> data) =>
      NoteStruct(
        noteText: deserializeParam(
          data['noteText'],
          ParamType.String,
          false,
        ),
        noteRating: deserializeParam(
          data['noteRating'],
          ParamType.double,
          false,
        ),
        noteReadingState: deserializeParam(
          data['noteReadingState'],
          ParamType.String,
          false,
        ),
        noteStartRead: deserializeParam(
          data['noteStartRead'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'NoteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NoteStruct &&
        noteText == other.noteText &&
        noteRating == other.noteRating &&
        noteReadingState == other.noteReadingState &&
        noteStartRead == other.noteStartRead;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([noteText, noteRating, noteReadingState, noteStartRead]);
}

NoteStruct createNoteStruct({
  String? noteText,
  double? noteRating,
  String? noteReadingState,
  DateTime? noteStartRead,
}) =>
    NoteStruct(
      noteText: noteText,
      noteRating: noteRating,
      noteReadingState: noteReadingState,
      noteStartRead: noteStartRead,
    );
