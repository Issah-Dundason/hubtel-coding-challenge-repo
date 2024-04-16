// This model or class represents a transaction history for a particular date
class TransactionHistory {
  final String date;
  final List<Transaction> transactions;

  TransactionHistory({required this.date, required this.transactions});
}

// This model or class represents the data present on a history card
class Transaction {
  final String time;
  final String message;
  final String name;
  final String contact;
  final bool favorite;
  final String currency;
  final String amount;
  final String reasonStatus;
  final TransactionStatus status;

  Transaction({
    required this.time,
    this.message = "Cool your heart wai",
    required this.name,
    required this.contact,
    this.favorite = false,
    this.currency = "GHS",
    required this.amount,
    this.reasonStatus = "Personal",
    this.status = TransactionStatus.failed,
  });
}

enum TransactionStatus { failed, success }
