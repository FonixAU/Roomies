import 'package:cloud_firestore/cloud_firestore.dart';

class User<T> {
  final String name;
  final String houseID;
  final int order;

  const User({
    required this.name,
    required this.houseID,
    required this.order,
  });

  factory User.fromDB
  (String userID,
  CollectionReference<Map<String, dynamic>> usersRef)
  {
    
    Map<String, dynamic> userResponse = 
    {"name": "ClassFailed",
    "houseID": "ClassID",
    "order": 1
    };
    usersRef.doc(userID).get().then((response) {
      userResponse = response.data()!;
    });
    User<T> user = User.fromJson(userResponse);
    return user;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User<T>(
      name: json['name'],
      houseID: json['houseID'],
      order: json['order']
    );
  }
}
