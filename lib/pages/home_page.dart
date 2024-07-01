//Auth Packages:
import 'package:firebase_auth/firebase_auth.dart' // new
    hide EmailAuthProvider, PhoneAuthProvider;    // new
import 'package:flutter/material.dart';           // new
import 'package:provider/provider.dart';          // new
import '../app_state.dart';                          // new
import '../src/authentication.dart';

import '../classes/user.dart'as local_users;
import 'package:go_router/go_router.dart';
import 'package:myapp/classes/house_hold.dart';
import 'package:myapp/methods/get_occupant_data.dart';
import '../variables/global_variables.dart';
import '../methods/fetch_data.dart';

class HomePage extends StatefulWidget {
  /// Constructs a [HomePage].
  const HomePage({
    super.key,
    required this.user,
  });
  final local_users.User user;
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HouseHold myHouse = getHouse();
    String myHouseName = myHouse.householdName;
    List<String> names = getNames(myHouse.occupants);

    local_users.User user = widget.user;
    String userName = user.name;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(myHouseName),
          actions: [Consumer<ApplicationState>(
            builder: (context, appState, _) => AuthFunc(
                loggedIn: appState.loggedIn,
                signOut: () {
                  FirebaseAuth.instance.signOut();
                }),
          ),],
        ),
        body: Row(children:[
            Container(
              alignment: Alignment.center,
              child:
            Text(userName
              ), 
            ),
            Container(
              alignment: Alignment.center,  
              child:
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: names.length,
                  itemBuilder: (context, index) =>
                      _residentBlocks(context, names[index])
                      )
              ),]),
        floatingActionButton: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 32),
                child: SizedBox(
                    width: minCalendarSize,
                    height: minCalendarSize,
                    child: Center(
                      child: ElevatedButton(
                          onPressed: () => context.go("/calendar"),
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.only(left: -10),
                              minimumSize: const Size.square(minCalendarSize),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Adjust the value as needed
                              )),
                          child: const Icon(Icons.calendar_month_rounded)),
                    )))
                ));
  }
  Widget _residentBlocks(BuildContext context, String name) {
    return (Row(children: [Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child:Padding(
          padding: const EdgeInsets.all(10),
          child: Text(name,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w100)))

    ),]));
  }
  
}
//Shadow?
// boxShadow: const [
//                     BoxShadow(
//                       color: Colors.grey,
//                       offset: Offset(
//                         5.0,
//                         5.0,
//                       ),
//                       blurRadius: 10.0,
//                       spreadRadius: 2.0,
//                     ), //BoxShadow
//                     BoxShadow(
//                       color: Colors.white,
//                       offset: Offset(0.0, 0.0),
//                       blurRadius: 0.0,
//                       spreadRadius: 0.0,
//                     ), //BoxShadow
//                   ],