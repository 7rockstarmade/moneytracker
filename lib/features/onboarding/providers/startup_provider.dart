import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartUpState {
  final bool seenOnBoarding;
  const StartUpState({required this.seenOnBoarding});
}

class StartUpNotifier extends AsyncNotifier<StartUpState> {
  @override
  Future<StartUpState> build() async {
    return StartUpState(seenOnBoarding: false);
  }

  Future<void> markOnBoardingSeen() async {
    state = const AsyncData(StartUpState(seenOnBoarding: true));
  }
}
