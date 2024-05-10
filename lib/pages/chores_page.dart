import 'package:flutter/material.dart';
import '../classes/chore.dart';
import 'package:myapp/methods/get_chores_data.dart';
import '../interfaces/card_modules.dart';
import '../pages/repeatable/filter_screen.dart';
import '../classes/house_hold.dart';
//testin purposes
import '../methods/fetch_data.dart';
import '../pages/repeatable/edit_screen.dart';

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
  List<Chore> chores = getHouse().chores;
  int filterValue = 0;
  List<Chore> filteredChores = [];

  @override 
  void initState() { 
    // Initialize the filtered 
    // list with all products 
    filteredChores = chores;  
    super.initState(); 
  } 
  void filterChoresByOrder(int order) { 
    setState(() {  
      if(order > 0){
      filteredChores = chores.where((element) =>
      element.currentOrder == order)
      .toList();
    }
    else{
      filteredChores = chores;
    }
    }); 
  }
  Future<void>_navToFilter(BuildContext context) async {
  // Navigator.push returns a Future that completes after calling
  // Navigator.pop on the Selection Screen.
  final filterValue = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const FilterScreen(label: 'Chores', occupants:[])),
  );
  filterChoresByOrder(filterValue);
}

  @override
  Widget build(BuildContext context) {

    List<String> names = getNames(filteredChores);
    List<String> frequencies = getFrequency(filteredChores);
    List<Color> colors = getChoreColors(filteredChores);
    List<int> orders = getCurrentOrders(filteredChores);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("Chores"),
          actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>const  EditScreen(label: 'Chores'),
                ));},
            icon: const Icon(Icons.add_rounded))),
            Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
            onPressed: (){
              _navToFilter(context);
            },icon:const Icon(Icons.filter_alt_rounded)))]
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
