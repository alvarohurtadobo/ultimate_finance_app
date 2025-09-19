class TransactionGroup {
  TransactionGroup({required this.id, required this.type, required this.name});

  final int id;
  final String type; // expense, income, income_debt, loan
  final String name;
}

List<TransactionGroup> myIncomeTransactionGroups = [
  TransactionGroup(id: 1, name: 'Actividad Económica', type: 'income'),
  TransactionGroup(id: 2, name: 'Intereses', type: 'income'),
  TransactionGroup(id: 3, name: 'Inversiones', type: 'income'),
  TransactionGroup(id: 4, name: 'Pago de deudas', type: 'income_debt'),
];

List<TransactionGroup> myExpensesTransactionGroups = [
  TransactionGroup(id: 11, name: 'Pago de deudas', type: 'expense'),
  TransactionGroup(id: 12, name: 'Gastos financieros', type: 'expense'),
  TransactionGroup(id: 13, name: 'Alimentación', type: 'expense'),
  TransactionGroup(id: 14, name: 'Vivienda', type: 'expense'),
  TransactionGroup(id: 15, name: 'Vestuario', type: 'expense'),
  TransactionGroup(id: 16, name: 'Salud', type: 'expense'),
  TransactionGroup(id: 17, name: 'Inversión', type: 'expense'),
  TransactionGroup(id: 18, name: 'Esparcimiento', type: 'expense'),
  TransactionGroup(id: 19, name: 'Transporte', type: 'expense'),
  TransactionGroup(id: 20, name: 'Viajes', type: 'expense'),
  TransactionGroup(id: 21, name: 'Otros gastos', type: 'expense'),
];
