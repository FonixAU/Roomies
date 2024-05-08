import '../classes/occupant.dart';
List<String> getNames(List<Occupant> occupants){
  List<String> names = List.empty(growable: true);
  for(Occupant occupant in occupants){
    names.add(occupant.name);
  }
  return names;
}
List<int> getOrders(List<Occupant> occupants){
  List<int> orders = List.empty(growable: true);
  for(Occupant occupant in occupants){
    orders.add(occupant.order);
  }
  return orders;
}
List<String> getEmails(List<Occupant> occupants){
  List<String> email = List.empty(growable: true);
  for(Occupant occupant in occupants){
    email.add(occupant.email);
  }
  return email;
}
String getFromOrder(List<Occupant> occupants, int order){
  String fromOrder = "Not Assigned";
  for(Occupant occupant in occupants){
    if (occupant.order == order){
      fromOrder = occupant.name;
    }
  }
  return fromOrder;
}