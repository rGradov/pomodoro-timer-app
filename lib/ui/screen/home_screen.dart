import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/ui/components/buttons/play_button.dart';
import 'package:pomodoro/ui/components/buttons/small_button.dart';
import 'package:pomodoro/vm/main_vm.dart';
import 'package:provider/provider.dart';

import '../../utils/app_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
            ),
            child: SafeArea(
              child: Column(
                children: const [
                  Header(),
                  Expanded(
                    flex: 2,
                    child: TimeWrapper(),
                  ),
                  Expanded(child: _ButtonsWrapper()),
                ],
              ),
            )));
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final current = context.select((MainVm vm) => vm.current);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
      width: current?.size.width,
      height: current?.size.height,
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
                current?.icon ?? "",
                color: Theme.of(context).canvasColor,
              ),
              Text(
                current?.name ?? "",
                style: Theme.of(context).textTheme.displayMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TimeWrapper extends StatelessWidget {
  const TimeWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final current = context.select((MainVm vm) => vm.current);
    return Text(
      formatDuration(current?.time),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}

class _ButtonsWrapper extends StatelessWidget {
  const _ButtonsWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SmallButton(
              callback: () => context.push("/settings"),
              color: Theme.of(context).dividerColor,
              child: SvgPicture.asset("assets/icons/three_dots.svg")),
          PlayButton(
            callback: () {},
            color: Theme.of(context).highlightColor,
          ),
          SmallButton(
              callback: () => context.read<MainVm>().moveNext(),
              color: Theme.of(context).dividerColor,
              child: SvgPicture.asset("assets/icons/forward.svg")),
        ],
      ),
    );
  }
}
