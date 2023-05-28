import 'package:flutter/material.dart';
import 'package:routine_app/src/pages/home/home_page.dart';
import 'package:routine_app/src/pages/login/login.dart';
import 'package:go_router/go_router.dart';
import 'package:routine_app/src/pages/main/tabs_screen.dart';

const String loginScreen = '/';
const String homeScreen = '/home';

final GoRouter appRoute = GoRouter(
  // main routes that can be accessed directly at app launch
  routes: <GoRoute>[
    GoRoute(
      path: loginScreen,
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage();
      },
    ),

    // Home screen
    GoRoute(
      path: homeScreen,
      builder: (BuildContext context, GoRouterState state) {
        return TabsScreenView();
      },
    ),
  ],
);
