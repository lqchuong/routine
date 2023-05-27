import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/pages/home/home_page.dart';
import 'package:flutter_ecommerce_app/src/pages/login/login.dart';
import 'package:flutter_ecommerce_app/src/pages/main/mainPage.dart';
import 'package:go_router/go_router.dart';

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
        return MainPage();
      },
    ),
  ],
);
