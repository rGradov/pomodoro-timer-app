import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../components/app_headers.dart';
import '../components/buttons/toggle_button.dart';

class IntervalScreen extends StatelessWidget {
  const IntervalScreen({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 3,
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style:  Theme.of(context).textTheme.labelMedium
                    ),
                  ),
                  const HeaderBackWrapper(
                    text: "Settings",
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const BlockItem(
                child: ListTile(
                  title: Text("10 min"),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              const BlockItem(
                child: ListTile(
                  title: Text("10 min"),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              const BlockItem(
                child: ListTile(
                  title: Text("10 min"),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              const BlockItem(
                child: ListTile(
                  title: Text("10 min"),
                ),
              ),
              const SizedBox(
                height: 1,
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
