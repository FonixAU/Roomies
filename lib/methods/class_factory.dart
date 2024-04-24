import '../classes/bills.dart';
import '../classes/chore.dart';
import '../classes/shared_item.dart';
import '../classes/house_hold.dart';
import '../variables/global_variables.dart';

dynamic labelClassFactory(String label){
  switch (label) {
      case "Bills":
        return Bill.fromJson(jsonTest);
      case "Chores":
        return Chore.fromJson(jsonTest);
      case "sharedItems":
        return SharedItem.fromJson(jsonTest);
      default:
        return HouseHold.fromJson(jsonTest);
    }
}