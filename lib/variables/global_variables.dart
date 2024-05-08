import 'package:flutter/material.dart';

const double minCalendarSize = 50;
const List<String> monthList = [
  "January",
  "Febuary",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];
const List<String> frequencyList = [
  "Daily",
  "Weekly",
  "Fortnightly",
  "Monthly",
  "Quarterly",
  "Yearly"
];
const List<Color> frequencyColor = [
  Colors.green,
  Colors.blue,
  Colors.purple,
  Colors.yellow,
  Colors.orange,
  Colors.red
];

Map<String, dynamic> jsonTest = {
  "householdName": "My Household",
  "occupants": [
    {"name": "John Doe", "email": "john.doe@example.com", "order": 1},
    {"name": "Jane Doe", "email": "jane.doe@example.com", "order": 2},
    {"name": "Jane Dove", "email": "jane.doe@example.com", "order": 3},
  ],
  "sharedItems": [
    {"name": "Paper Towels", "lastPurchasedBy": "John Doe", "notes": ""},
    {"name": "Toilet Paper", "lastPurchasedBy": "Jane Doe", "notes": ""},
    {"name": "Toilet Paper", "lastPurchasedBy": "Jane Doe", "notes": ""}
  ],
  "chores": [
    {"name": "Dishes", "frequency": "Weekly", "currentOrder": 1},
    {"name": "Vaccum", "frequency": "Weekly", "currentOrder": 2},
    {"name": "Bathroom", "frequency": "Weekly", "currentOrder": 3},
    {"name": "Stove", "frequency": "Monthly", "currentOrder": 2},
    {"name": "Air-con Maintenance", "frequency": "Quarterly", "currentOrder": 1}
  ],
  "bills": [
    {
      "name": "Rent",
      "frequency": "Monthly",
      "dueDate": DateTime.now,
      "nominee": 2,
      "hhSize": 3,
      "totalAmount": 567
    },
    {
      "name": "Electricity",
      "frequency": "Monthly",
      "dueDate": DateTime.now,
      "nominee": 1,
      "hhSize": 3,
      "totalAmount": 140
    },
    {
      "name": "Internet",
      "frequency": "Monthly",
      "dueDate": DateTime.now,
      "nominee": 3,
      "hhSize": 3,
      "totalAmount": 80
    },
    {
      "name": "Gym",
      "frequency": "Fortnightly",
      "dueDate": DateTime.now,
      "nominee": 2,
      "hhSize": 3,
      "totalAmount": 78,
      "totalOwed": 52,
      "owedPP": [
        {"order": 1, "amount": 26},
        {"order": 2, "amount": 26},
        {"order": 3, "amount": 0}
      ]
    },
    {
      "name": "Gas",
      "frequency": "Quarterly",
      "dueDate": DateTime.now,
      "nominee": 1,
      "hhSize": 3,
      "totalAmount": 45,
      "totalOwed": 45,
      "owedPP": [
        {"order": 1, "amount": 22.5},
        {"order": 2, "amount": 22.5},
      ]
    }
  ]
};
const Map<String, dynamic> userJson = {
  "name": "Jane Doe",
  "email": "jane.doe@example.com",
  "houseID": 1,
  "order": 2
};
