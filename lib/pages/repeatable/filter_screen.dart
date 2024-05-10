import 'package:flutter/material.dart';
import 'package:myapp/classes/house_hold.dart';
import '../../classes/occupant.dart';
import '../../methods/get_occupant_data.dart';
//For Testing
import '../../methods/fetch_data.dart';

/// The details screen for either the A or B screen.
class FilterScreen extends StatefulWidget {
  /// Constructs a [FilterScreen].
  const FilterScreen({
    required this.label,
    required this.occupants,
    super.key,
  });

  /// The label to display in the center of the screen.
  final String label;
  final List<Occupant> occupants;

  @override
  State<StatefulWidget> createState() => FilterScreenState();
}

/// The state for FilterScreen
class FilterScreenState extends State<FilterScreen> {
  bool userFilter = false;
  // swap for import
  HouseHold house = getHouse();
  int dropdownValue = 0;
  @override
  Widget build(BuildContext context) {
    List<Occupant> filterList = house.occupants;
    List<String> nameList = ["All"];
    nameList.addAll(getNames(filterList));
    List<int> orderList = [0];
    orderList.addAll(getOrders(filterList));

    return Scaffold(
      appBar: AppBar(
        title: Text('Filter - ${widget.label}'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Selected Filter: ${nameList[dropdownValue]}',
                style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.fromLTRB(4,0,4,20)),
            DropdownButton<int>(
               value: dropdownValue,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
              onChanged: (int? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: orderList.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(" ${nameList[value]}"),
                  );
                }).toList(),
              ),
            
            Padding(
              padding:const EdgeInsets.only(top: 15),
              child: OutlinedButton(
              onPressed: () {
                Navigator.pop(
                context,dropdownValue,
                );
              },
              child: const Text('Save Filter'),
            )),

          ],
        ),
      ),
    );
  }
}