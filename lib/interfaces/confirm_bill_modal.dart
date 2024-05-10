//WIP

// import 'package:flutter/material.dart';
// import '../classes/house_hold.dart';
// import '../variables/global_variables.dart';
// import '../methods/get_occupant_data.dart' as occupant_m;
// import '../classes/user.dart';
// import'../classes/owed.dart';

// class BillPaidModal extends StatelessWidget {
//   const BillPaidModal({
//     super.key,
//     required this.nominee,
//     required this.frequency,
//     required this.totalAmount,
//     required this.totalOwed,
//     required this.dueDate,
//     required this.myHouse,  
//     required this.user,  
//     required this.owedPP,
//   });

// final int nominee;
// final double totalAmount;
// final double totalOwed;
// final String frequency;
// final DateTime dueDate;
// final HouseHold myHouse;
// final User user;
// final Owed owedPP;
// @override 
// Widget build(BuildContext context) {
//     String day = dueDate.day.toString();
//     String month = monthList[dueDate.month];
//     double userOwed = (owedPP.amount * 100).round() / 100;
//     String owedAmount;
//     if(user.order == nominee)
//     {
//       owedAmount  = "\$$totalOwed";
//     }
//     else{
//       owedAmount = "\$$userOwed";
//     }


//     return (Card(
//         clipBehavior: Clip.antiAlias,
//         margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
//         elevation: 3,
//         color:Colors.white,
//         surfaceTintColor: Colors.white,
//         child:
//         Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
              
//                 Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                   )
//                 ),  
//                 child: Row(
//                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children:[
//                        Padding(
//                       padding: const EdgeInsets.fromLTRB(15,0,15,5),
//                           child: Text("$day / $month",

//                           style:
//                               const TextStyle(fontSize: 14, fontWeight: FontWeight.w100)
//                       )),      
//                       ]),
//                       Padding(
//                       padding: const EdgeInsets.all(15),
//                       child: Text("\$$totalAmount",
//                           style:
//                               const TextStyle(fontSize: 20, fontWeight: FontWeight.w100)
//                               ))  
//             ])
//                 ),
//         //Second Half Of Card
//                 const Divider(
//                   indent: 10,
//                   endIndent: 10,
//                 )
//                 ,Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10),
//                   )
//                 ),  
//                 child:Row(
//                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Row(children: 
//                     //Buttons
//                     [Padding(
//                       padding: EdgeInsets.fromLTRB(10,0,10,10),
//                       child:Checkbox.adaptive(value: false, onChanged:null,
//                        )),Padding(
//                       padding: EdgeInsets.fromLTRB(10,0,10,10),
//                       child:Icon(Icons.edit_rounded)
//                       ,)],),
//                       //Modular Owing Bubble
//                       Expanded(
//                         flex:2,
//                         child:Padding(
//                       padding: const EdgeInsets.fromLTRB(10,0,10,10),
//                       child:Container(
//                         decoration: BoxDecoration(
//                           color: owedColorBg,
//                           borderRadius: BorderRadius.circular(50)),
//                         child:Padding(
//                           padding:const EdgeInsets.fromLTRB(15,10,15,10),
//                           child:Wrap(
//                             alignment:WrapAlignment.spaceBetween,
//                             crossAxisAlignment: WrapCrossAlignment.center,
//                             children:[
//                             Text(owedMessage,
//                           style:
//                               const TextStyle(fontSize: 12, fontWeight: FontWeight.w100)
//                       ),
//                       Text(owedAmount,
//                           style:
//                               TextStyle(
//                                 color: owedColorTxt,
//                                 fontSize: 15, fontWeight: FontWeight.bold)
//                       ),
//                           ]
//                             ))))) 
//             ])
//             )
//             ])
//           ));}
// }
