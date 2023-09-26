import 'package:affirmations_app/ui/pages/auth/auth_page.dart';
import 'package:affirmations_app/ui/pages/auth/login_page.dart';
import 'package:affirmations_app/ui/pages/auth/sign_up_page.dart';
import 'package:affirmations_app/ui/pages/favorites/favorites_page.dart';
import 'package:affirmations_app/ui/pages/home/home_page.dart';
import 'package:affirmations_app/ui/pages/profile/profile_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:affirmations_app/router/route_names.dart';
import 'package:affirmations_app/router/route_paths.dart';
import 'package:affirmations_app/providers/services_providers.dart';

class AppRouter {
  AppRouter(WidgetRef ref) {
    appRouter = _getAppRouter(ref);
  }

  /// Use this for testing to change the initial
  /// location and quickly access some page
  @visibleForTesting
  String setInitialLocation(String location) => initialLocation = location;

  late GoRouter appRouter;
  static String initialLocation = RoutePaths.auth;

  GoRouter _getAppRouter(WidgetRef ref) => GoRouter(
        initialLocation: initialLocation,
        debugLogDiagnostics: true,
        redirect: (context, state) {
          final auth = ref.watch(authServiceProvider);
          if (state.fullPath == RoutePaths.auth && auth.currentUser != null) {
            return RoutePaths.home;
          } else if (state.fullPath == RoutePaths.auth && auth.currentUser == null) {
            return RoutePaths.login;
          }
          return null;
        },
        routes: [
          GoRoute(
            path: RoutePaths.auth,
            name: RouteNames.auth,
            builder: (context, state) => AuthPage(),
          ),
          GoRoute(
            path: RoutePaths.home,
            name: RouteNames.home,
            builder: (context, state) => const HomePage(),
            routes: [
              GoRoute(
                path: RoutePaths.profile,
                name: RouteNames.profile,
                builder: (context, state) => const ProfilePage(),
                routes: [
                  GoRoute(
                    path: RoutePaths.favorites,
                    name: RouteNames.favorites,
                    builder: (context, state) => FavoritesPage(
                      favoritesType: state.extra as FavoritesType,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: RoutePaths.login,
            name: RouteNames.login,
            builder: (context, state) => const LoginPage(),
            routes: [
              GoRoute(
                path: RoutePaths.signup,
                name: RouteNames.signup,
                builder: (context, state) => const SignUpPage(),
              ),
            ],
          ),
        ],
      );
}
