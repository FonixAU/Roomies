import "owed.dart";

class Bill<T> {
  String name;
  String frequency;
  DateTime dueDate;
  int nominee;
  int hhSize;
  double totalAmount;
  double totalOwed;
  List<Owed> owedPP;

  Bill(
      {required this.name,
      required this.frequency,
      required this.dueDate,
      required this.nominee,
      required this.hhSize,
      required this.totalAmount,
      required this.totalOwed,
      required this.owedPP});

  factory Bill.fromJson(Map<String, dynamic> json) {
    double totalOwed;
    if(json.containsKey('totalOwed')) {
      totalOwed = json['totalOwed'];
    }else
    {
      totalOwed = json['totalAmount'];
    }
    List<Owed> owedPP = List.empty(growable: true);
    if (json.containsKey('owedPP')){
      for (var user in json['owedPP']) {
      Owed owed = Owed.fromJson(user);
      owedPP.add(owed);
      }
    }
    else{
      int size = json['hhSize'];
      for (int i = 1; i <= size; i++) {
        Owed newOwed = Owed(order: i, amount:(totalOwed/size));
        owedPP.add(newOwed);
      }
    }
    return Bill<T>(
        name: json['name'],
        frequency: json['frequency'],
        dueDate: DateTime.now(),
        // dueDate: json['dueDate'],
        nominee: json['nominee'],
        hhSize: json['hhSize'],
        totalAmount: json['totalAmount'],
        totalOwed: totalOwed,
        owedPP: owedPP);
  }
}
