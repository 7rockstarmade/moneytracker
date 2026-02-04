import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytracker/features/shared/models/transaction_model.dart';
import 'hive_boxes.dart';

class HiveInit {
  HiveInit._();

  static Future<void> init() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(TransactionModelAdapter());
    }

    if (!Hive.isBoxOpen(HiveBoxes.settings)) {
      await Hive.openBox(HiveBoxes.settings);
    }

    if (!Hive.isBoxOpen(HiveBoxes.transactions)) {
      await Hive.openBox<TransactionModel>(HiveBoxes.transactions);
    }
  }
}
