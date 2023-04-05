import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/ui/screen/interval_screen.dart';

import '../ui/screen/home_screen.dart';
import '../ui/screen/settings_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: "/",
    pageBuilder: (ctx, state) {
      return CustomTransitionPage(
          child: const HomeScreen(),
          transitionsBuilder: (ctx, animation, secondaryAnimation, child) {
            /// FIXME: refactor me
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            var curve = Curves.ease;
            var curveTween = CurveTween(curve: curve);
            var tween = Tween(begin: begin, end: end).chain(curveTween);
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          });
    },
  ),
  GoRoute(
    path: "/settings",
    pageBuilder: (ctx, state) {
      return CustomTransitionPage(
          child: const SettingsScreen(),
          transitionsBuilder: (ctx, animation, secondaryAnimation, child) {
            /// FIXME: refactor me
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            var curve = Curves.ease;
            var curveTween = CurveTween(curve: curve);
            var tween = Tween(begin: begin, end: end).chain(curveTween);
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          });
    },
    routes: [
      GoRoute(
        path: "interval",
        pageBuilder: (ctx, state) {
          return CustomTransitionPage(
              child: const IntervalScreen(),
              transitionsBuilder: (ctx, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                var curve = Curves.ease;
                var curveTween = CurveTween(curve: curve);
                var tween = Tween(begin: begin, end: end).chain(curveTween);
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              });
        },
      ),
    ],
  ),
]);
