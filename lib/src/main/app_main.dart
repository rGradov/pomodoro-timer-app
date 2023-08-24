import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';

import '../../main.dart';
import '../../models/settings_model.dart';
import '../../service/settings_service.dart';
import '../../utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/navigation/app_navigation.dart';
import 'package:pomodoro/utils/app_utils.dart';
import 'package:pomodoro/vm/main_vm.dart';
import 'package:pomodoro/vm/settings_vm.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'main_model.dart';
part 'main_wm.dart';
part "main_widget.dart";