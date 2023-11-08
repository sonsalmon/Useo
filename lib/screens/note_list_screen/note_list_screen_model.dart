import '../../backend/schema/structs/note_struct.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class NoteListScreenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for search widget.
  bool isSearching = false;
  TextEditingController? searchController;
  String? Function(BuildContext, String?)? searchControllerValidator;
  List<NoteStruct> noteList = [];
  List<NoteStruct> filteredNoteList = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    // noteList.add(NoteStruct(
    //   noteText:
    //       'Escape to the serene beauty of the mountains and enjoy a luxurious stay in our cozy mountain house, the perfect destination for your dream mountain getaway.',
    // ));
    // noteList.add(NoteStruct(
    //   noteText:
    //       '그 자리에서 빌보는 걸음을 딱 멈추었다. 그곳에서 앞으로 발을 내딛은 것은 그때까지 그가 해 온 일들 중에서 가장 용감한 행동이었다. 그 이후에 일어난 엄청난 사건들은 그에 비하면 아무것도 아니었다. 숨어서 기다리고 있는 그 어마어마한 위험과 직면하기 전에 그는 굴속에서 혼자 진정한 싸움을 벌인 것이다. 어떻든 그는 잠시 걸음을 멈추었다가 다시 발을 앞으로 내딛었다. ',
    // ));
    // noteList.add(NoteStruct(
    //   noteText:
    //       '“독수리! 독수리야! 독수리들이 오고 있다!"\n빌보는 소리쳤다. 빌보의 눈은 거의 틀림없었다. 수많은 독수리들이 줄지어 바람을 타고 날아오고 있었다. 북쪽땅에 있는 모든 둥지에서 불러모은 듯 대군을 이루고 있었다. \n“독수리! 독수리야!"\n빌보는 춤을 추고 팔을 흔들면서 소리쳤다. 요정들은 그를 볼 수 없었지만 그의 목소리는 들을 수 있었다. 곧 요정들도 그 소리를 이어받아 함께 외쳤고 그 함성은 골짜기에 울려 퍼졌다. 골짜기에 있던 수많은 사람들이 놀라 하늘을 올려다보았지만 아직은 산의 남쪽 등성이 외의 어디에서도 보이지 않았다.',
    // ));
    // noteList.add(NoteStruct(
    //   noteText:
    //       '사람들은 어떻게 알고 길을 잘 찾는 걸까? 한남동에 가려는 사람들은 한남동으로, 압구정동에 가려는 사람들은 압구정동으로, 남으로, 북으로, 서쪽 끝으로, 동쪽 끝으로. 어떻게 화분을 실을 때 그것이 뒷자석을 건들지 않도록, 의자나 문에 자꾸 부딪히지 않도록 할 수 있을까? 아니 애초에 사람들은 정말로 목적지로 향하고 있기나 한 걸까? 어쩌면 사실은 우리처럼 길을 잘못 들어서 엉뚱한 방향과 시간과 자기 자신을 죽이면서 속으로 분노를 삭이고 (아니면 삭이지도 못하고) 앉아 있는 거 아닐까? 그래서 뒷자석에서 신경을 거스르는 화분을 차창 밖으로 던져버리고 싶은 충동을 억누르고 있지는 않을까? ',
    // ));
    filteredNoteList = noteList;
  }

  void dispose() {
    unfocusNode.dispose();
    searchController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
