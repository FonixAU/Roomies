import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/classes/house_hold.dart';
import 'package:myapp/methods/get_chores_data.dart';
import '../interfaces/card_modules.dart';
import '../variables/global_variables.dart';
import '../methods/fetch_data.dart';
class ChorePage extends StatefulWidget {
  /// Constructs a [ChorePage].
  const ChorePage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => ChorePageState();
}

class ChorePageState extends State<ChorePage> {
  HouseHold myHouse = getHouse();
  @override
  Widget build(BuildContext context) {
    String myHouseName = myHouse.householdName;
    List<String> names = getNames(myHouse.chores);
    List<String> frequencies = getFrequency(myHouse.chores);
    List<Color> colors = getChoreColors(myHouse.chores);
    List<int> orders = getCurrentOrders(myHouse.chores);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("$myHouseName: Chores"),
        ),
        body: Center(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                    ChoreCard(name:names[index],
                        order:orders[index],
                        color:colors[index],
                        frequency:frequencies[index],
                        myHouse: myHouse,
                      ),
                  childCount: names.length,
                  ),
                ),
              
          ],
          )
        ),
        floatingActionButton: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 32),
                child: SizedBox(
                    width: minCalendarSize,
                    height: minCalendarSize,
                    child: Center(
                      child: ElevatedButton(
                          onPressed: () => context.go('names/add'),
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.only(left: -10),
                              minimumSize: const Size.square(minCalendarSize),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Adjust the value as needed
                              )),
                          child: const Icon(Icons.add)),
                    )))));
  }
}
