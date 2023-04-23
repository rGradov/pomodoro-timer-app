import 'package:objectbox/objectbox.dart';
import 'package:pomodoro/models/settings_model.dart';

@Entity()
class SettingsEntity {
  SettingsEntity(
      {this.darkMode = false,
      this.sound = false,
      this.notification = false,
      this.longBreakTime = 10,
      this.breakTime = 5,
      this.focusTime = 25});
  factory SettingsEntity.fromSettings({required SettingsModel settings}) {
    return SettingsEntity(
        darkMode: settings.darkMode,
        sound: settings.sound,
        breakTime: settings.breakTime,
        longBreakTime: settings.longBreakTime,
        focusTime: settings.focusTime,
        notification: settings.notification);
  }
  @Id()
  int id = 0;
  @Property()
  bool darkMode;
  @Property()
  bool sound;
  @Property()
  bool notification;
  @Property(type: PropertyType.int)
  int breakTime;
  @Property(type: PropertyType.int)
  int focusTime;
  @Property(type: PropertyType.int)
  int longBreakTime;
}

extension OnSettingsEntity on SettingsEntity {
  SettingsModel toModel() => SettingsModel(
      darkMode: darkMode,
      notification: notification,
      sound: sound,
      focusTime: focusTime,
      longBreakTime: longBreakTime,
      breakTime: breakTime);
}
