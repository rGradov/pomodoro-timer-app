import 'package:flutter/material.dart';
import 'package:pomodoro/navigation/app_navigation.dart';
import 'package:pomodoro/vm/main_vm.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => MainVm(),
    lazy: false,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final current = context.select((MainVm vm) => vm.current);
    return MaterialApp.router(
      routerConfig: router,
      theme: current?.theme ?? ThemeData(),
    );
  }
}
