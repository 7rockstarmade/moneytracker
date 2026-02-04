import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytracker/core/storage/hive_boxes.dart';

class ThemeController extends Notifier<bool> {
  late final Box _settings;

  @override
  bool build() {
    _settings = Hive.box(HiveBoxes.settings);
    return _settings.get(SettingsKeys.isDarkTheme, defaultValue: false) as bool;
  }

  Future<void> switchTheme() async {
    final next = !state;
    state = next;
    await _settings.put(SettingsKeys.isDarkTheme, next);
  }
}

final themeProvider = NotifierProvider<ThemeController, bool>(
  ThemeController.new,
);
