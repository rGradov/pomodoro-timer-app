import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../components/buttons/toggle_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF2F2),
      body: SafeArea(
        child: Column(
          children: const [
            SettingList(),
          ],
        ),
      ),
    );
  }
}

class SettingList extends StatelessWidget {
  const SettingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        SizedBox(height: 20),
        _HeaderWrapper(),
         SizedBox(height: 20),
        GestureDetector(onTap: (){
          context.push("/settings/interval");
        },child:       const Text("interval"),),
        ToggleButton(
          text: "dark mode",
          value: false,
        ),
        ToggleButton(
          text: "sound",
          value: false,
        ),
        ToggleButton(
          text: "notification",
          value: false,
        ),
        ToggleButton(
          text: "auto resume timer",
          value: true,
        ),
      ],
    );
  }
}

class _HeaderWrapper extends StatelessWidget {
  const _HeaderWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Settings",
          style: TextStyle(
              fontSize: 24,
              fontFamily: "RobotoFlex",
              fontWeight: FontWeight.bold,
              color: Color(0xFF471515)),
        ),
        GestureDetector(
          onTap: () => context.pop(),
          child: Text("done",style:  TextStyle(
              fontSize: 18,
              fontFamily: "RobotoFlex",
              fontWeight: FontWeight.bold,
              color:  const Color(0xFFFF4C4C).withOpacity(0.71)),),
        ),
      ],
    );
  }
}
