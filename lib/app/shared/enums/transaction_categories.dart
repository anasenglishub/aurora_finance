enum TransactionCategory {
  food('Food', 'food'),
  transportation('Transportation', 'transportation'),
  housing('Housing', 'housing'),
  utilities('Utilities', 'utilities'),
  entertainment('Entertainment', 'entertainment'),
  health('Health', 'health'),
  education('Education', 'education'),
  clothing('Clothing', 'clothing'),
  personal('Personal', 'personal'),
  income('Income', 'income'),
  other('Other', 'other');

  final String name;
  final String value;

  const TransactionCategory(this.name, this.value);
}