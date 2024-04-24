import 'package:myapp/variables/global_variables.dart';
import 'package:flutter/material.dart';
import '../classes/chore.dart';
List<String> getNames(List<Chore> chores){
  List<String> names = List.empty(growable: true);
  for(Chore chore in chores){
    names.add(chore.name);
  }
  return names;
}
List<int>getCurrentOrders(List<Chore> chores){
  List<int> currentOrder = List.empty(growable: true);
  for(Chore chore in chores){
    currentOrder.add(chore.currentOrder);
  }
  return currentOrder;
}
List<String> getFrequency(List<Chore> chores){
  List<String> frequency = List.empty(growable: true);
  for(Chore chore in chores){
    frequency.add(chore.frequency);
  }
  return frequency;
}
List<Color> getChoreColors(List<Chore> chores){
  List<String> frequencies= getFrequency(chores);
  List<Color> colors = List.empty(growable: true);
  for(String frequency in frequencies){
    colors.add(frequencyColor[frequencyList.indexOf(frequency)]);
  }
  return colors;
}
