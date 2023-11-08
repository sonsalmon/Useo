import 'package:my_useo/api_service.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'note_list_screen_model.dart';
export 'note_list_screen_model.dart';

class NoteListScreenWidget extends StatefulWidget {
  const NoteListScreenWidget({Key? key}) : super(key: key);

  @override
  _NoteListScreenWidgetState createState() => _NoteListScreenWidgetState();
}

class _NoteListScreenWidgetState extends State<NoteListScreenWidget> {
  late NoteListScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoteListScreenModel());

    _model.searchController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        print('바깥 터치 -> unfocus');
        FocusScope.of(context).requestFocus(_model.unfocusNode);
        setState(() {
          _model.isSearching = false;
          _model.filteredNoteList = _model.noteList;
        });
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 250.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/inaki-del-olmo-NIJuEQw0RKg-unsplash.jpg',
                      ).image,
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    // decoration: BoxDecoration(
                    //   color: Color(0x9A1D2428),
                    // ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 64.0, 16.0, 12.0),
                      child: Column(
                        // mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Text(
                              '독서 노트 검색',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                          Text(
                            '적어 두었던 기록을 확인해보세요',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xBEFFFFFF),
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.searchController,
                                // onChanged: (value) => EasyDebounce.debounce(
                                //   '_model.textController',
                                //   Duration(milliseconds: 2000),
                                //   () => setState(() {}),
                                // ),
                                // chatgpt 코드
                                onTap: () {
                                  //검색 텍스트 필드 클릭하면 검색상태로 진입
                                  print('on tap textform field');
                                  setState(() {
                                    _model.isSearching = true;
                                  });
                                },
                                onChanged: (value) {
                                  print('내용 바뀌는 중');
                                  if (_model.isSearching) {
                                    if (_model.searchController.text.isEmpty) {
                                      setState(() {
                                        _model.filteredNoteList = [];
                                      });
                                    } else {
                                      setState(() {
                                        _model.filteredNoteList = _model
                                            .noteList
                                            .where((note) => note.content
                                                .toLowerCase()
                                                .contains(value.toLowerCase()))
                                            .toList();
                                      });
                                    }
                                  }
                                },

                                // autofocus: true,
                                // obscureText: false,
                                decoration: InputDecoration(
                                  labelText: '내용 검색',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelLarge,
                                  suffixIcon: _model.isSearching
                                      ? IconButton(
                                          icon: Icon(Icons.clear),
                                          onPressed: () {
                                            print('클리어텍스트');
                                            setState(() {
                                              _model.searchController?.clear();
                                              _model.filteredNoteList = [];
                                            });
                                          })
                                      : null,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          24.0, 24.0, 0.0, 24.0),
                                  prefixIcon: Icon(
                                    Icons.search_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                                keyboardType: TextInputType.emailAddress,
                                validator: _model.searchControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                FutureBuilder(
                    future: ApiService.getNoteList(
                        nickname: FFAppState().signupnickname),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        _model.noteList = snapshot.data!;
                        _model.filteredNoteList = _model.noteList;

                        return NoteList(model: _model);
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NoteList extends StatelessWidget {
  const NoteList({
    super.key,
    required NoteListScreenModel model,
  }) : _model = model;

  final NoteListScreenModel _model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 52.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          for (var note in _model.filteredNoteList)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
              child: Container(
                width: double.infinity,
                // height: 150.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x411D2429),
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 4.0, 8.0),
                              child: Text(
                                '책 제목',
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context).titleLarge,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Color(0xFF57636C),
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 8.0, 0.0),
                        child: Text(
                          '${note.content}',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 8.0, 0.0),
                        child: Text(
                          '${DateFormat('yyyy년 MM월 dd일 HH:mm').format(note.addDate!)}',
                          style: FlutterFlowTheme.of(context).labelSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
