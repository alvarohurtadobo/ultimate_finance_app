class Transaction {
  const Transaction({
    required this.id,
    required this.transactionGroupId,
    required this.amount,
  });
  final int id;
  final int transactionGroupId;
  final double amount;
}
