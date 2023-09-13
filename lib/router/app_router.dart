import 'package:affirmations_app/ui/pages/home/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'route_names.dart';
import 'route_paths.dart';

class AppRouter {
  AppRouter(WidgetRef ref) {
    appRouter = _getAppRouter(ref);
  }

  /// Use this for testing to change the initial
  /// location and quickly access some page
  @visibleForTesting
  String setInitialLocation(String location) => initialLocation = location;

  late GoRouter appRouter;
  static String initialLocation = RoutePaths.home;

  GoRouter _getAppRouter(WidgetRef ref) => GoRouter(
        initialLocation: initialLocation,
        debugLogDiagnostics: true,
        routes: [
          GoRoute(
            path: RoutePaths.home,
            name: RouteNames.home,
            builder: (context, state) => HomePage(
              key: state.pageKey,
            ),
            routes: [],
          ),
        ],
      );
}
