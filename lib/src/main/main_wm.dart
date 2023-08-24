part of "app_main.dart";

class MainWm extends WidgetModel<AppMain, ElementaryMainModel> {
  MainWm(ElementaryMainModel model) : super(model);

  ValueListenable<SettingsModel> get settings => model.settings;
}

MainWm createMainWm(BuildContext _) => MainWm(mainModel);
