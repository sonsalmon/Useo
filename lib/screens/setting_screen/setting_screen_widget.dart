import 'package:flutter/material.dart';
import 'package:my_useo/flutter_flow/flutter_flow_util.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../flutter_flow/flutter_flow_theme.dart';

class SettingScreenWidget extends StatefulWidget {
  const SettingScreenWidget({super.key});

  @override
  State<SettingScreenWidget> createState() => _SettingScreenWidgetState();
}

class _SettingScreenWidgetState extends State<SettingScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SettingsList(
          lightTheme: SettingsThemeData(
              settingsListBackground:
                  FlutterFlowTheme.of(context).primaryBackground,
              settingsSectionBackground:
                  FlutterFlowTheme.of(context).secondaryBackground),
          sections: [
            SettingsSection(
              title: Text('유저 프로필 설정'),
              margin: EdgeInsetsDirectional.all(30),
              tiles: [
                SettingsTile(
                  title: Text('프로필 설정'),
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: CircleAvatar(
                      radius: 24,
                    ),
                  ),
                  onPressed: (context) {
                    context.pushNamed('EditProfileScreen');
                    // Navigate to change profile picture
                  },
                ),
              ],
            ),
            SettingsSection(
              title: Text('로그인 설정'),
              tiles: [
                SettingsTile(
                  title: Text('로그아웃'),
                  onPressed: (context) {
                    FFAppState().isSignedIn = false;
                    FFAppState().signupUsername = '';
                    FFAppState().signupnickname = '';
                    FFAppState().signupPassword = '';
                    FFAppState().loginToken = '';
                    context.goNamed('LoginScreen');

                    // Navigate to change profile picture
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
