import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pixaland/core/modules/homefeed/view/homefeed_page.dart';
import 'package:pixaland/core/modules/splashscreen/splashscreen_page.dart';

extension ObjectExtension on Object? {
  dynamic getValue(String key, dynamic alt) {
    if (this == null) return alt;
    return (this as Map<String, dynamic>)[key] ?? alt;
  }
}

// ===================
// Core Builder
// ===================

Page splashscreenBuilder(BuildContext context, GoRouterState state) {
  final from = state.queryParams['from'];
  return CustomTransitionPage(
    key: state.pageKey,
    child: SplashScreenPage(nextRoute: from),
    transitionDuration: const Duration(milliseconds: 100),
    transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
  );
}

Page homeFeedBuilder(BuildContext context, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: const HomeFeedPage(),
    transitionDuration: const Duration(milliseconds: 100),
    transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
  );
}

Page underMaintenanceBuilder(BuildContext context, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: Container(),
    transitionDuration: const Duration(milliseconds: 100),
    transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
  );
}
