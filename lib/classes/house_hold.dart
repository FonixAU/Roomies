import './occupant.dart';
import './chore.dart';
import './bills.dart';

// import './chore.dart';
class HouseHold<T> {
  String householdName;
  List<Occupant> occupants;
  List<Chore> chores;
  List<Bill>bills;

  HouseHold({
    required this.householdName,
    required this.occupants,
    required this.chores,
    required this.bills,
  });
  void addOccupant(Occupant occupant) {
    occupants.add(occupant);
  }

  // void addSharedItem(Map<String, T> sharedItem) {
  //   sharedItems.add(sharedItem);
  // }

  Map<String, dynamic> toJson() {
    return {
      'householdName': householdName,
      'occupants': occupants,
      'chores': chores,
      // 'sharedItems': sharedItems,
    };
  }

  factory HouseHold.fromJson(Map<String, dynamic> json) {
    List<Occupant> occupants = List.empty(growable: true);
    for (var user in json['occupants']) {
      Occupant occupant = Occupant.fromJson(user);
      occupants.add(occupant);
    }
    List<Chore> chores = List.empty(growable: true);
    for (var user in json['chores']) {
      Chore chore = Chore.fromJson(user);
      chores.add(chore);
    }
    List<Bill> bills = List.empty(growable: true);
    for (var user in json['bills']) {
      Bill bill = Bill.fromJson(user);
      bills.add(bill);
    }

    return HouseHold<T>(
      householdName: json['householdName'],
      occupants: occupants,
      chores: chores,
      bills: bills,
      // sharedItems: List<Map<String, T>>.from(json['sharedItems']),
    );
  }
}
