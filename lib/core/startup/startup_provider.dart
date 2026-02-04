import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/storage/hive_boxes.dart';

class StartupState {
  final bool seenOnboarding;
  const StartupState({required this.seenOnboarding});
}

class StartupController extends AsyncNotifier<StartupState> {
  @override
  Future<StartupState> build() async {
    final settings = Hive.box(HiveBoxes.settings);
    final seen =
        settings.get(SettingsKeys.seenOnboarding, defaultValue: false) as bool;

    return StartupState(seenOnboarding: seen);
  }

  Future<void> markOnboardingSeen() async {
    final settings = Hive.box(HiveBoxes.settings);
    await settings.put(SettingsKeys.seenOnboarding, true);
    state = const AsyncData(StartupState(seenOnboarding: true));
  }
}

final startupProvider = AsyncNotifierProvider<StartupController, StartupState>(
  StartupController.new,
);
