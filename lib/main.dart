import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytracker/app.dart';
import 'package:moneytracker/features/shared/models/transaction_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionModelAdapter());
  await Hive.openBox<TransactionModel>('transactions');
  await Hive.openBox('settings');

  runApp(ProviderScope(child: const MoneyTrackerApp()));
}
