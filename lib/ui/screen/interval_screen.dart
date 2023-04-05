import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../components/app_headers.dart';

class IntervalScreen extends StatelessWidget {
  const IntervalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFF2F2),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const HeaderBackWrapper(
                text: "Settings",
              ),
              ListTile(
                title: Text("10 min"),
              ),
              ListTile(
                title: Text("25 min"),
              ),
              ListTile(
                title: Text("55 min"),
                leading: Icon(
                  Icons.check,
                  color: Color(0xFFFF4C4C).withOpacity(0.71),
                ),
              ),
              ListTile(
                title: Text("90 min"),
              ),
            ],
          ),
        ));
  }
}

class _HeaderWrapper extends StatelessWidget {
  const _HeaderWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 0.7,
            child: RotatedBox(
              quarterTurns: 2,
              child: SvgPicture.asset("assets/icons/arrow.svg"),
            ),
          ),
          const Text(
            "Settings",
            style: TextStyle(
                fontSize: 24,
                fontFamily: "RobotoFlex",
                fontWeight: FontWeight.bold,
                color: Color(0xFF471515)),
          ),
        ],
      ),
    );
  }
}
