import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/resources/resources.dart';
import 'package:pomodoro/ui/components/app_headers.dart';
import 'package:pomodoro/utils/app_export.dart';
import 'package:pomodoro/utils/app_locator.dart';
import 'package:pomodoro/vm/settings_vm.dart';
import 'package:provider/provider.dart';
import '../components/buttons/toggle_button.dart';

/// Setting screen
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
    return Consumer<SettingsVm>(builder: (_, vm, __) {
      return FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            HeaderWrapper(
              text: "Settings",
              callback: () => context.pop(true),
              child: Text(
                "done",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            const SizedBox(height: 20),
            const TimeIntervalWrapper(),
            const SizedBox(height: 20),
            SettingsBlock(
              text: "Pomodoro",
              children: [
                SettingsBlockElement(
                    callback: () async {
                      final result = await context
                          .push<bool>("/settings/interval/Pomodoros");
                      if (result != null) {
                        context.read<SettingsVm>().init();
                      }
                    },
                    text: "Pomodoro until long break",
                    value: "3"),
                const SizedBox(
                  height: 1,
                ),
              ],
            ),
            const SizedBox(height: 20),
            SettingsBlock(
              text: "general",
              children: [
                ToggleBlockButton(
                  text: "dark mode",
                  value: vm.state.darkMode,
                  callback: vm.toggleDarkMode,
                ),
                const SizedBox(height: 1),
                ToggleBlockButton(
                  text: "sound",
                  callback: vm.toggleSound,
                  value: vm.state.sound,
                ),
                const SizedBox(height: 1),
                ToggleBlockButton(
                  text: "notification",
                  value: vm.state.notification,
                  callback: vm.toggleNotification,
                ),
              ],
            ),
          ],
        ),
      );
    });
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
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: FontFamily.robotoFlex,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).canvasColor),
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
      color: Theme.of(context).dividerColor,
      constraints:
          const BoxConstraints(minHeight: 40, minWidth: double.infinity),
      child: FractionallySizedBox(
        widthFactor: 0.9,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Theme.of(context).canvasColor,
                fontSize: 16,
                fontFamily: FontFamily.robotoFlex,
              ),
            ),
            GestureDetector(
              onTap: callback,
              child: Row(
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      color: Theme.of(context).canvasColor,
                      fontSize: 14,
                      fontFamily: FontFamily.robotoFlex,
                    ),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: Theme.of(context).canvasColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeIntervalWrapper extends StatelessWidget {
  const TimeIntervalWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = context.select((SettingsVm vm) => vm.state);
    return SettingsBlock(
      text: "time intervals",
      children: [
        SettingsBlockElement(
            callback: () async {
              final result = await context.push("/settings/interval/",extra: IntervalType.focus);
              if (result != null) {
                context.read<SettingsVm>().init();
              }
            },
            text: "Focus",
            value: "${settings.focusTime} min"),
        const SizedBox(
          height: 1,
        ),
        SettingsBlockElement(
            callback: () async {
              final result =
                  await context.push<bool>("/settings/interval",extra: IntervalType.shortBreak);
              if (result != null) {
                context.read<SettingsVm>().init();
              }
            },
            text: "Break",
            value: "${settings.breakTime} min"),
        const SizedBox(height: 1),
        SettingsBlockElement(
            callback: () async{
              final result =
                  await context.push("/settings/interval",extra: IntervalType.longBreak);
              if (result != null) {
                context.read<SettingsVm>().init();
              }
            },
            text: "Long break",
            value: "${settings.longBreakTime} min"),
      ],
    );
  }
}
