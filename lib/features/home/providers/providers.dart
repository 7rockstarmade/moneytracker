import 'package:flutter_riverpod/legacy.dart';

final txTitleProvider = StateProvider.autoDispose<String>((ref) => '');
final txAmountProvider = StateProvider.autoDispose<String>((ref) => '');
