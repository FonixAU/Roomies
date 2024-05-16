class User<T> {
  final String name;
  final String surname;
  final int houseID;
  final int order;

  const User({
    required this.name,
    required this.surname,
    required this.houseID,
    required this.order,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User<T>(
      name: json['name'],
      surname: json['surname'],
      houseID: json['houseID'],
      order: json['order']
    );
  }
}
