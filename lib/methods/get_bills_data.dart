import 'package:flutter/material.dart';
import 'package:myapp/variables/global_variables.dart';
import '../classes/owed.dart';
import '../classes/bills.dart';
import '../classes/user.dart';

List<String> getNames(List<Bill> bills){
  List<String> names = List.empty(growable: true);
  for(Bill bill in bills){
    names.add(bill.name);
  }
  return names;
}
List<int>getNominees(List<Bill> bills){
  List<int> nominee = List.empty(growable: true);
  for(Bill bill in bills){
    nominee.add(bill.nominee);
  }
  return nominee;
}
List<String> getFrequency(List<Bill> bills){
  List<String> frequency = List.empty(growable: true);
  for(Bill bill in bills){
    frequency.add(bill.frequency);
  }
  return frequency;
}
List<DateTime> getDateTimes(List<Bill> bills){
  List<DateTime> dueDates = List.empty(growable: true);
  for(Bill bill in bills){
    dueDates.add(bill.dueDate);
  }
  return dueDates;
}
List<double>getTotalAmounts(List<Bill> bills){
  List<double> totalAmount = List.empty(growable: true);
  for(Bill bill in bills){
    totalAmount.add(bill.totalAmount);
  }
  return totalAmount;
}
List<double>getTotalOwed(List<Bill> bills){
  List<double> totalOwed = List.empty(growable: true);
  for(Bill bill in bills){
    totalOwed.add(bill.totalOwed);
  }
  return totalOwed;
}
List<Owed>getOwedPP(List<Bill> bills, User user){
  List<Owed> owedPP = List.empty(growable: true);

  for(Bill bill in bills){
    owedPP.add(getUserOwed(bill.owedPP,user));
  }
  return owedPP;
}
Owed getUserOwed(List<Owed> owedPP,User user){
  for(Owed item in owedPP){
    if(item.order == user.order){
      return item;
    }
  }
  return owedPP[0];
}
List<Color> getBillColors(List<Bill> bills){
  List<String> frequencies= getFrequency(bills);
  List<Color> colors = List.empty(growable: true);
  for(String frequency in frequencies){
    colors.add(frequencyColor[frequencyList.indexOf(frequency)]);
  }
  return colors;
}








