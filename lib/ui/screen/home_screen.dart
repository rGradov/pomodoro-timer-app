import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/ui/components/buttons/play_button.dart';
import 'package:pomodoro/ui/components/buttons/small_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFF2F2),
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
                   child:  TimeWrapper(),),
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
    return Container(
      width: 130,
      height: 50,
      decoration: BoxDecoration(
          color: const Color(0xFFFFF2F2),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            width: 2,
            color: const Color(0xFF471515),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset("assets/icons/brain.svg"),
          const Text(
            "focus",
            style: TextStyle(
                color: Color(0xFF471515),
                fontFamily: "RobotoFlex",
                fontSize: 24),
          )
        ],
      ),
    );
  }
}

class TimeWrapper extends StatelessWidget {
  const TimeWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "25 00",
      textAlign: TextAlign.center,
      style: TextStyle(

          fontFamily: "RobotoFlex", fontSize: 212, color: Color(0xFF471515)),
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
              color: const Color(0xFFFF4C4C).withOpacity(0.15),
              child: SvgPicture.asset("assets/icons/three_dots.svg")),
          PlayButton(
            callback: () {},
            color: const Color(0xFFFF4C4C).withOpacity(0.71),
          ),
          SmallButton(
              callback: () {},
              color: const Color(0xFFFF4C4C).withOpacity(0.15),
              child: SvgPicture.asset("assets/icons/forward.svg")),
        ],
      ),
    );
  }
}
