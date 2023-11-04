import 'dart:async';

import 'package:flutter/material.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: FFAppState().isSignedIn
          ? '/homeScreen'
          : '/', //로그인 했으면 초기화면 homescreen
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => LoginScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => LoginScreenWidget(),
        ),
        FFRoute(
          name: 'LoginScreen',
          path: '/loginScreen',
          builder: (context, params) => LoginScreenWidget(),
        ),
        FFRoute(
          name: 'HomeScreen',
          path: '/homeScreen',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'HomeScreen')
              : HomeScreenWidget(),
        ),
        FFRoute(
          name: 'TimerScreen',
          path: '/timerScreen',
          builder: (context, params) => TimerScreenWidget(
            startTime: params.getParam('startTime', ParamType.DateTime),
          ),
        ),
        FFRoute(
          name: 'FinishReadingScreen_1',
          path: '/finishReadingScreen1',
          builder: (context, params) => FinishReadingScreen1Widget(
            startTime: params.getParam('startTime', ParamType.DateTime),
            finishTime: params.getParam('finishTime', ParamType.DateTime),
            readingDuration:
                params.getParam('readingDuration', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'FinishReadingScreen_2',
          path: '/finishReadingScreen2',
          builder: (context, params) => FinishReadingScreen2Widget(
            startTime: params.getParam('startTime', ParamType.DateTime),
            finishTime: params.getParam('finishTime', ParamType.DateTime),
            readingDuration:
                params.getParam('readingDuration', ParamType.String),
            isInLibrary: params.getParam('isInsLibrary', ParamType.bool),
            // currentBook: params.getParam('currentBook', ParamType.),
          ),
        ),
        FFRoute(
          name: 'LibraryScreen',
          path: '/libraryScreen',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'LibraryScreen')
              : LibraryScreenWidget(),
        ),
        FFRoute(
          name: 'BookDetailScreen',
          path: '/bookDetailScreen',
          builder: (context, params) => BookDetailScreenWidget(
            // isbn: params.getParam('isbn', ParamType.int),
            // bookName: params.getParam('bookName', ParamType.String),
            // bookImage: params.getParam('bookImage', ParamType.String),
            // bookAuthor: params.getParam('bookAuthor', ParamType.String),
            // bookCategory: params.getParam('bookCategory', ParamType.String),
            // bookSummery: params.getParam('bookSummery', ParamType.String),
            // bookPublisher: params.getParam('bookPublisher', ParamType.String),
            book: params.getParam('book', ParamType.BookStruct),
            inMyLibrary: params.getParam('inMyLibrary', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'NoteListScreen',
          path: '/noteListScreen',
          builder: (context, params) => NoteListScreenWidget(),
        ),
        FFRoute(
          name: 'SearchBookScreen',
          path: '/searchBookScreen',
          builder: (context, params) => SearchBookScreenWidget(
            nowReading: params.getParam('nowReading', ParamType.bool) ?? false,
          ),
        ),
        FFRoute(
          name: 'SearchUserScreen',
          path: '/searchUserScreen',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'searchUserScreen')
              : SearchUserScreenWidget(),
        ),
        FFRoute(
          name: 'SignUpScreen',
          path: '/signUpScreen',
          builder: (context, params) => SignUpScreenWidget(),
        ),
        FFRoute(
          name: 'SignUpUsernameScreen',
          path: '/signUpUsernameScreen',
          builder: (context, params) => SignUpUsernameScreenWidget(),
        ),
        // FFRoute(
        //   name: 'SignUpUsernameConfirmationScreen',
        //   path: '/signUpUsernameConfirmationScreen',
        //   builder: (context, params) =>
        //       SignUpUsernameConfirmationScreenWidget(),
        // ),
        FFRoute(
          name: 'LibraryOtherScreen',
          path: '/libraryOtherScreen',
          builder: (context, params) => LibraryOtherScreenWidget(
            username: params.getParam('username', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'FollowingListScreen',
          path: '/FollowingListScreen',
          builder: (context, params) => FollowingListScreenWidget(),
        ),
        FFRoute(
          name: 'SettingScreen',
          path: '/settingScreen',
          builder: (context, params) => SettingScreenWidget(),
        ),
        FFRoute(
          name: 'EditProfileScreen',
          path: '/editProfileScreen',
          builder: (context, params) => EditProfileScreenWidget(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
