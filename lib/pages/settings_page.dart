import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("Settings"),
        ),
        body: Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[ Column(
          children: <Widget>[
            Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
            onPressed: () => context.go("/"),
            child: const Text("Add Resident"))),
            ElevatedButton(
            onPressed: () => context.go("/"),
            child: const Text("Go to Settings"),
          ),
        ])]));
  }
}
