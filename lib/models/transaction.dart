import 'package:uuid/uuid.dart';

enum TransactionType { income, expense }

class Transaction {
  final String id;
  final String title;
  final double amount;
  final TransactionType type;
  final String categoryId;
  final DateTime date;
  final String userId;
  final bool isRecurring;
  final String? recurrenceInterval;

  Transaction({
    String? id,
    required this.title,
    required this.amount,
    required this.type,
    required this.categoryId,
    required this.date,
    required this.userId,
    this.isRecurring = false,
    this.recurrenceInterval,
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'type': type.toString(),
      'category_id': categoryId,
      'date': date.toIso8601String(),
      'user_id': userId,
      'is_recurring': isRecurring,
      'recurrence_interval': recurrenceInterval,
    };
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      title: json['title'],
      amount: json['amount'].toDouble(),
      type: json['type'] == 'TransactionType.income' 
          ? TransactionType.income 
          : TransactionType.expense,
      categoryId: json['category_id'],
      date: DateTime.parse(json['date']),
      userId: json['user_id'],
      isRecurring: json['is_recurring'] ?? false,
      recurrenceInterval: json['recurrence_interval'],
    );
  }
}