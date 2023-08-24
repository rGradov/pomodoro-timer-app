part of "app_settings.dart";

class SettingsScreen extends ElementaryWidget<SettingsWM> {
  const SettingsScreen({Key? key}) : super(createSettingsWm, key: key);

  @override
  Widget build(SettingsWM wm) {
    return Scaffold(
      backgroundColor: wm.backgroundColor,
      body: SafeArea(
          child: SizedBox.expand(
        child: Column(
          children: [
            FractionallySizedBox(
              widthFactor: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  HeaderWrapper(
                    text: wm.settingsHeader,
                    callback: wm.onBackButtonClick,
                    child: Text(wm.doneText, style: wm.doneStyle),
                  ),
                  const SizedBox(height: 20),
                  // const TimeIntervalWrapper(),
                  const SizedBox(height: 20),
                  SettingsBlock(
                    text: wm.pomodoroText,
                    children: [
                      SettingsBlockElement(
                          callback: () {},
                          text: "Pomodoro until long break",
                          value: "3"),
                      const SizedBox(height: 1),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SettingsBlock(
                    text: wm.general,
                    children: [
                      ToggleBlockButton(
                        text: wm.darkMode,
                        value: false,
                        callback: wm.onToggleDarkModeClick,
                      ),
                      const SizedBox(height: 1),
                      ToggleBlockButton(
                        text: wm.sound,
                        value: false,
                        callback: wm.onToggleSoundClick,
                      ),
                      const SizedBox(height: 1),
                      ToggleBlockButton(
                        text: wm.notification,
                        value: false,
                        callback: wm.onToggleNotificationClick,
                      ),
                      const SizedBox(height: 1),
                      SettingsBlockElement(
                          callback: () {}, text: wm.language, value: "EN"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
