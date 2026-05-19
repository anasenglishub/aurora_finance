enum FixedBillStatus {
  pending('Por pagar'),
  paid('Pago'),
  overdue('Atrasado');

  final String name;

  const FixedBillStatus(this.name);
}