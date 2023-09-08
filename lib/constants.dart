import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Map<String, String> sortOptions = {
  'recent_add': "최근 추가 순",
  'title': '제목 내림차순',
  'author': '작가 내림차순',
  'recent_read': '최근 읽은 순',
};

const Map<String, String> readingState = {
  'reading': '읽는 중이에요',
  'pause': '잠시 멈췄어요',
  'quit': '읽다 그만뒀어요',
  'finish': '다 읽었어요',
  'never': '읽지 않을 거에요',
};
const Map<String, IconData> readingStateIcon = {
  'reading': Icons.menu_book_outlined,
  'pause': Icons.pause_rounded,
  'quit': Icons.hourglass_empty_rounded,
  'finish': FontAwesomeIcons.award,
  'never': Icons.do_not_disturb,
};
