import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/classes/house_hold.dart';
import 'package:myapp/methods/get_bills_data.dart';
import '../interfaces/card_modules.dart';
import '../variables/global_variables.dart';
import '../methods/fetch_data.dart';
import '../classes/user.dart';
import '../classes/owed.dart';

class BillsPage extends StatefulWidget {
  /// Constructs a [BillsPage].
  const BillsPage({
    super.key,
    required this.user,
  });
  final User user;
  @override
  State<StatefulWidget> createState() => BillsPageState();
}

class BillsPageState extends State<BillsPage> {
  HouseHold myHouse = getHouse();
  @override
  Widget build(BuildContext context,) {
    User user = widget.user;
    String myHouseName = myHouse.householdName;
    List<String> names = getNames(myHouse.bills);
    List<String> frequencies = getFrequency(myHouse.bills);
    List<int> nominees = getNominees(myHouse.bills);
    List<double> totalAmount = getTotalAmounts(myHouse.bills);
    List<DateTime> dueDates = getDateTimes(myHouse.bills);
    List<double> totalOwed = getTotalAmounts(myHouse.bills);
    List<Owed> owedPP = getOwedPP(myHouse.bills, user);
    List<Color> freqColors = getBillColors(myHouse.bills);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("$myHouseName: Bills"),
        ),
        body: Center(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                    BillCard(name:names[index],
                        nominee:nominees[index],
                        frequency:frequencies[index],
                        totalAmount: totalAmount[index],
                        dueDate: dueDates[index],
                        myHouse: myHouse,
                        user: user,
                        totalOwed: totalOwed[index],
                        owedPP: owedPP[index],
                        freqColor: freqColors[index],
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
                              minimumSize:const  Size.square(minCalendarSize),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Adjust the value as needed
                              )),
                          child: const Icon(Icons.add)),
                    )))));
  }
}
