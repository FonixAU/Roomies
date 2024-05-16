class Occupant<T> {
  String name;
  String surname;
  int order;
  Occupant({required this.name, required this.surname, required this.order});

  factory Occupant.fromJson(Map<String, dynamic> json) {
    return Occupant<T>(
        name: json['name'], surname: json['surname'], order: json['order']);
  }
}
