import 'package:flutter/material.dart';
import '../classes/user.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/classes/house_hold.dart';
import 'package:myapp/methods/get_chores_data.dart';
import '../interfaces/card_modules.dart';
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
    List<String> names = getNames(myHouse.chores);
    List<String> frequencies = getFrequency(myHouse.chores);
    List<Color> colors = getChoreColors(myHouse.chores);
    List<int> orders = getCurrentOrders(myHouse.chores);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("Chores"),
          actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
            onPressed: () => context.go('chores/add'),
            icon: const Icon(Icons.add_rounded))),
            Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
            onPressed: () => context.go('chores/filter'),
            icon:const Icon(Icons.filter_alt_rounded)))],
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
                    );
  }
}
