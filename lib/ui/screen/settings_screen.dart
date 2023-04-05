import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/ui/components/app_headers.dart';

import '../components/buttons/toggle_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF2F2),
      body: SafeArea(
          child: SizedBox.expand(
        child: Column(
          children: const [
            SettingList(),
          ],
        ),
      )),
    );
  }
}

class SettingList extends StatelessWidget {
  const SettingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          HeaderWrapper(
            text: "Settings",
            callback: () => context.pop(),
            child: Text(
              "done",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "RobotoFlex",
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFF4C4C).withOpacity(0.71)),
            ),
          ),
          const SizedBox(height: 20),
          SettingsBlock(
            text: "time intervals",
            children: [
              SettingsBlockElement(
                  callback: () => context.push("/settings/interval"),
                  text: "Focus",
                  value: "10min"),
              const SizedBox(
                height: 1,
              ),
              SettingsBlockElement(
                  callback: () => context.push("/settings/interval"),
                  text: "Break",
                  value: "10min"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SettingsBlock(
            text: "general",
            children: [
              ToggleBlockButton(
                text: "dark mode",
                value: false,
              ),
              SizedBox(
                height: 1,
              ),
              ToggleBlockButton(
                text: "dark mode",
                value: false,
              ),
              SizedBox(
                height: 1,
              ),
              ToggleBlockButton(
                text: "dark mode",
                value: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsBlock extends StatelessWidget {
  const SettingsBlock({Key? key, required this.text, required this.children})
      : super(key: key);
  final String text;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Text(
              text.toUpperCase(),
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: "RobotoFlex",
                fontWeight: FontWeight.bold,
                color: Color(0xFF471515),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Column(
          children: children,
        )
      ],
    );
  }
}

class SettingsBlockElement extends StatelessWidget {
  const SettingsBlockElement(
      {Key? key,
      required this.callback,
      required this.text,
      required this.value})
      : super(key: key);
  final VoidCallback callback;
  final String text;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFFFF4C4C).withOpacity(0.15),
        constraints:
            const BoxConstraints(minHeight: 40, minWidth: double.infinity),
        child: FractionallySizedBox(
          widthFactor: 0.9,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(text),
              GestureDetector(
                onTap: callback,
                child: Row(
                  children: [
                    Text(value),
                    const Icon(
                      Icons.navigate_next,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
