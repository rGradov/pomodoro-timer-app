import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:pomodoro/ui/components/buttons/play_button.dart';
import 'package:pomodoro/ui/components/buttons/small_button.dart';
import 'package:pomodoro/vm/main_vm.dart';
import 'package:provider/provider.dart';

import '../../utils/app_utils.dart';

class HomesScreen extends StatelessWidget {
  const HomesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: const SafeArea(
          child: Column(
            children: [
              Header(),
              Expanded(
                flex: 2,
                child: TimeWrapper(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final current = context.select((MainVm vm) => vm.current);
    if (current == null) {
      return const SizedBox();
    } else {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
        width: current.size.width,
        height: current.size.height,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              width: 2,
              color: Theme.of(context).canvasColor,
            )),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  current.icon,
                  color: Theme.of(context).canvasColor,
                ),
                Text(
                  current.name,
                  style: Theme.of(context).textTheme.displayMedium,
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}

class TimeWrapper extends StatelessWidget {
  const TimeWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
        stream: context.read<MainVm>().stream,
        builder: (_, snapshot) {
          return Text(
            formatDuration(snapshot.data),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          );
        });
  }
}

