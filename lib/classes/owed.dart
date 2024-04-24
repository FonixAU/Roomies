class Owed<T>{
  int order;
  double amount;
  bool late;

  Owed({
    required this.order,
    required this.amount,
    this.late = false
  });
  factory Owed.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('late')) {
      return Owed<T>(
        order: json['order'], amount: json['amount'], late: json['late']);
    }
    return Owed<T>(
        order: json['order'], amount: json['amount']);
  }
}
