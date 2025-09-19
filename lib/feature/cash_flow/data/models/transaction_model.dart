class Transaction {
  Transaction({
    required this.id,
    required this.type,
    required this.name,
    required this.groupId,
  });

  final int id;
  final String type; // exprense, income
  final String name;
  final int groupId;
}

List<Transaction> myTransactions = [
  Transaction(id: 1, type: 'income', name: 'Salario', groupId: 1),
  Transaction(id: 2, type: 'income', name: 'Consultoría', groupId: 1),
  Transaction(id: 3, type: 'income', name: 'Ventas', groupId: 1),
  Transaction(id: 4, type: 'income', name: 'Clases particulares', groupId: 1),
  // Expenses
  // 13. Alimentación
  Transaction(id: 11, type: 'expense', name: 'Mercado', groupId: 13),
  Transaction(id: 12, type: 'expense', name: 'Desayuno', groupId: 13),
  Transaction(id: 13, type: 'expense', name: 'Almuerzo', groupId: 13),
  Transaction(id: 14, type: 'expense', name: 'Cena', groupId: 13),
  Transaction(id: 15, type: 'expense', name: 'Hidratación', groupId: 13),
  // 14. Vivienda
  Transaction(id: 16, type: 'expense', name: 'Alquiler', groupId: 14),
  Transaction(id: 17, type: 'expense', name: 'Agua', groupId: 14),
  Transaction(id: 18, type: 'expense', name: 'Electricidad', groupId: 14),
];
