import '../../variables/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Widget for the root/initial pages in the bottom navigation bar.
class RootScreen extends StatelessWidget {
  /// Creates a RootScreen
  const RootScreen({required this.label, required this.detailsPath, super.key});

  /// The label
  final String label;

  /// The path to the detail page
  final String detailsPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage $label'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Screen $label',
                style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () => context.go(detailsPath),
              child: const Text('View details'),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
          alignment: Alignment.bottomLeft,
          child:Padding(
          padding: const EdgeInsets.only(left: 32),
          child:SizedBox(
          width: minCalendarSize,
          height: minCalendarSize,
          child:Center(
          child: ElevatedButton(
            onPressed: () => context.go(detailsPath),
            style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(left: -10),
            minimumSize:const Size.square(minCalendarSize),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Adjust the value as needed
            )),
              child: const Icon(Icons.edit)
          ),
        ))
        )));
  }
}
