import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytracker/features/shared/models/transaction_model.dart';

class TransactionsRepo {
  static const _boxName = 'transactions';

  Box<TransactionModel> get _box => Hive.box<TransactionModel>(_boxName);

  List<TransactionModel> getAllSorted() {
    final items = _box.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return items;
  }

  List<TransactionModel> latest(int limit) {
    final items = getAllSorted();
    return items.take(limit).toList();
  }

  Future<void> add(TransactionModel tx) => _box.add(tx);

  Future<void> deleteAt(int index) => _box.deleteAt(index);

  double getTotalIncome() {
    return _box.values
        .where((tx) => tx.isIncome)
        .fold(0.0, (sum, tx) => sum + tx.amount);
  }

  double getTotalExpense() {
    return _box.values
        .where((tx) => !tx.isIncome)
        .fold(0.0, (sum, tx) => sum + tx.amount);
  }

  ValueListenable<Box<TransactionModel>> listenable() => _box.listenable();
}

final transactionsProvider = Provider((ref) => TransactionsRepo());
