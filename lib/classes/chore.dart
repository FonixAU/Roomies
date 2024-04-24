class Chore<T> {
  String name;
  String frequency;
  int currentOrder;
    Chore({
    required this.name,
    required this.frequency,
    required this.currentOrder
  });

  factory Chore.fromJson(Map<String, dynamic> json) {
  return Chore<T>
    (name: json['name'],
    frequency: json['frequency'], 
    currentOrder: json['currentOrder']);
  }
}