import 'package:pomodoro/ui/screen/interval_screen.dart';
import '../ui/screen/home_screen.dart';
import '../ui/screen/settings_screen.dart';
import '../utils/app_export.dart';

/// FIXME: refactor me
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
              child: IntervalScreen(
                name: (state.extra as IntervalType).name,
                type: state.extra as IntervalType,
              ),
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
      GoRoute(
        path: "language",
        pageBuilder: (ctx, state) {
          return CustomTransitionPage(
              child: IntervalScreen(
                name: (state.extra as IntervalType).name,
                type: state.extra as IntervalType,
              ),
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
