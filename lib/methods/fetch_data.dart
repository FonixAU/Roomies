// import 'dart:convert';
// import 'dart:io';
import '../classes/house_hold.dart';
import '../variables/global_variables.dart';

String jsonPath = '../classes/house_hold.json';

HouseHold getHouse(){
  HouseHold house = HouseHold.fromJson(jsonTest);
  return house;
}  
//   Future<String> readFile() async {
//   return File(jsonPath).readAsString();
// }
// Future<Map<String,dynamic>> getJson() async{
//   String fileString = await readFile();
//   return jsonDecode(fileString);
// }
//HouseHold getHouse(){
  // HouseHold myHouseHold;
  // try{
  // getJson().then((jsonHouse){
  // myHouseHold = HouseHold.fromJson(jsonHouse);  
  // return myHouseHold;
  // });
  // }
  // catch(e){
  //   rethrow;
  // }
  // myHouseHold = HouseHold(householdName: "Failed to fetch house hold");
  // return myHouseHold;

