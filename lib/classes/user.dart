class User<T> {
  final String name;
  final String email;
  final int houseID;
  final int order;

  const User({
    required this.name,
    required this.email,
    required this.houseID,
    required this.order,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User<T>(
      name: json['name'],
      email: json['email'],
      houseID: json['houseID'],
      order: json['order']
    );
  }
}
