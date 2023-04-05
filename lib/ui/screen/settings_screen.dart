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
      children: const [
        SizedBox(height: 20),
        _HeaderWrapper(),
         SizedBox(height: 20),
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
          child: SvgPicture.asset('assets/icons/exit.svg'),
        ),
      ],
    );
  }
}
