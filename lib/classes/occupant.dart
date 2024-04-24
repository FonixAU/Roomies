class Occupant<T> {
  String name;
  String email;
  int order;
  Occupant({required this.name, required this.email, required this.order});

  factory Occupant.fromJson(Map<String, dynamic> json) {
    return Occupant<T>(
        name: json['name'], email: json['email'], order: json['order']);
  }
}
