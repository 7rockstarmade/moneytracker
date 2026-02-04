import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
  @HiveField(0)
  final double amount;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final DateTime createdAt;

  @HiveField(3)
  final bool isIncome;

  TransactionModel({
    required this.amount,
    required this.title,
    required this.createdAt,
    required this.isIncome,
  });
}
