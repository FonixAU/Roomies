import 'package:flutter/material.dart';
import '../classes/house_hold.dart';
import '../variables/global_variables.dart';
import '../methods/get_occupant_data.dart' as occupant_m;
import '../classes/user.dart';
import'../classes/owed.dart';
// ignore: depend_on_referenced_packages
class ChoreCard extends StatelessWidget {
  const ChoreCard({
    super.key,
    required this.name,
    required this.order,
    required this.color,
    required this.frequency,
    required this.myHouse,    
  });
final String name; 
final int order;
final Color color;
final String frequency;
final HouseHold myHouse;
@override 
Widget build(BuildContext context) {
    return (Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        elevation: 3,
        child:
        Column(
            mainAxisSize: MainAxisSize.max,
            children: [
                Container(
                  width: double.infinity,
                  padding:const EdgeInsets.fromLTRB(10,5,5,5),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(frequency,style:const TextStyle(color: Colors.white,fontWeight: FontWeight.w400, fontSize:15)),
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children:[IconButton(
                      icon: const Icon(Icons.edit_rounded, color:Colors.white),
                      onPressed: () => {},),
                      IconButton(
                      icon: const Icon(Icons.task_alt_rounded, color:Colors.white),
                      onPressed: () => {},)])
              ])
            ),Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
                ),  
                child:Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                      Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(name,
                          style:
                              const TextStyle(fontSize: 20, fontWeight: FontWeight.w100)))
                    ,Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(occupant_m.getFromOrder(myHouse.occupants, order),
                          style:
                              const TextStyle(fontSize: 15, fontWeight: FontWeight.w100)))  
                ])
            )
        ])
          ));}
}

class BillCard extends StatelessWidget {
  const BillCard({
    super.key,
    required this.name,
    required this.nominee,
    required this.frequency,
    required this.totalAmount,
    required this.totalOwed,
    required this.dueDate,
    required this.myHouse,  
    required this.user,  
    required this.owedPP,
    required this.freqColor,
  });
final String name; 
final int nominee;
final double totalAmount;
final double totalOwed;
final String frequency;
final DateTime dueDate;
final HouseHold myHouse;
final User user;
final Owed owedPP;
final Color freqColor;
@override 
Widget build(BuildContext context) {
    String day = dueDate.day.toString();
    String month = monthList[dueDate.month];
    Color owedColorBg = const Color.fromARGB(255, 255, 172, 133);
    Color owedColorTxt = const Color.fromARGB(255, 255, 172, 133);
    String owedMessage = "";
    double userOwed = (owedPP.amount * 100).round() / 100;
    String owedAmount;
    if(user.order == nominee)
    {
      owedMessage = "You are owed";
      owedAmount  = "\$$totalOwed";
      owedColorBg = const Color.fromRGBO(207,255,208,1);
      owedColorTxt = const Color.fromRGBO(19,108,29,1);
    }
    else{
      owedMessage = "You owe";
      owedAmount = "\$$userOwed";
      owedColorBg = const Color.fromRGBO(255,225,225,1);
      owedColorTxt = const Color.fromRGBO(158,59,72,1);
    }


    return (Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        elevation: 3,
        color:Colors.white,
        surfaceTintColor: Colors.white,
        child:
        Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  width: double.infinity,
                  padding:const EdgeInsets.fromLTRB(8, 5, 8, 5),
                  decoration: BoxDecoration(
                    color: freqColor,
                    borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
                ),
                Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )
                ),  
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[Padding(
                      padding: const EdgeInsets.fromLTRB(15,10,15,5),
                      child: Text(name,
                          style:
                              const TextStyle(fontSize: 18, fontWeight: FontWeight.w100)
                      )),
                       Padding(
                      padding: const EdgeInsets.fromLTRB(15,0,15,5),
                          child: Text("$day / $month",

                          style:
                              const TextStyle(fontSize: 14, fontWeight: FontWeight.w100)
                      )),      
                      ]),
                      Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("\$$totalAmount",
                          style:
                              const TextStyle(fontSize: 20, fontWeight: FontWeight.w100)
                              ))  
            ])
                ),
        //Second Half Of Card
                const Divider(
                  indent: 10,
                  endIndent: 10,
                )
                ,Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
                ),  
                child:Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(children: 
                    //Buttons
                    [Padding(
                      padding: EdgeInsets.fromLTRB(10,0,10,10),
                      child:Checkbox.adaptive(value: false, onChanged:null,
                       )),Padding(
                      padding: EdgeInsets.fromLTRB(10,0,10,10),
                      child:Icon(Icons.edit_rounded)
                      ,)],),
                      //Modular Owing Bubble
                      Expanded(
                        flex:2,
                        child:Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,10),
                      child:Container(
                        decoration: BoxDecoration(
                          color: owedColorBg,
                          borderRadius: BorderRadius.circular(50)),
                        child:Padding(
                          padding:const EdgeInsets.fromLTRB(15,10,15,10),
                          child:Wrap(
                            alignment:WrapAlignment.spaceBetween,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children:[
                            Text(owedMessage,
                          style:
                              const TextStyle(fontSize: 12, fontWeight: FontWeight.w100)
                      ),
                      Text(owedAmount,
                          style:
                              TextStyle(
                                color: owedColorTxt,
                                fontSize: 15, fontWeight: FontWeight.bold)
                      ),
                          ]
                            ))))) 
            ])
            )
            ])
          ));}
}
