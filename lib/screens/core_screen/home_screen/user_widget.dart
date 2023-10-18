import 'dart:core';
import 'package:flutter/material.dart';
import 'package:my_useo/flutter_flow/flutter_flow_theme.dart';

class User extends StatelessWidget {
  final String nickname, profileMessage;
  final String? profileImage;
  const User({
    super.key,
    required this.scaffoldKey, //??
    required this.nickname,
    required this.profileImage,
    required this.profileMessage,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              scaffoldKey.currentState!.openDrawer();
            },
            child: Container(
              width: 60.0,
              height: 60.0,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: (profileImage == null)
                  ? Image.asset(
                      'assets/images/default_profile.jpeg',
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      profileImage!,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  nickname,
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 32.0,
                      ),
                ),
                Text(
                  '님, 어서오세요',
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Outfit',
                        fontSize: 32.0,
                      ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
              child: Text(
                profileMessage,
                style: FlutterFlowTheme.of(context).labelMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
