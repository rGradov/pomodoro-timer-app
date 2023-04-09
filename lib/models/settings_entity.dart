import 'package:objectbox/objectbox.dart';
import 'package:pomodoro/models/settings_model.dart';

@Entity()
class SettingsEntity {
  SettingsEntity(
      {this.darkMode = false, this.sound = false, this.notification = false});
  factory SettingsEntity.fromSettings({required SettingsModel settings}) {
    return SettingsEntity(
        darkMode: settings.darkMode,
        sound: settings.sound,
        notification: settings.notification);
  }
  @Id()
  int id = 1;
  @Property()
  bool darkMode;
  @Property()
  bool sound;
  @Property()
  bool notification;
  @Property(type: PropertyType.int)
  int breakTime = 5;
  @Property(type: PropertyType.int)
  int focusTime = 25;
  @Property(type: PropertyType.int)
  int longBreakTime = 10;
}

extension OnSettingsEntity on SettingsEntity {
  SettingsModel toModel() => SettingsModel(
      darkMode: darkMode, notification: notification, sound: sound);
}
