import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
//Import Any Supporting Files
import './classes/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() {
  //Initialising Firebase
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  // turn off the # in the URLs on the web
  usePathUrlStrategy();
  runApp(const Roomies());
}

class Roomies extends StatelessWidget {
  const Roomies({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purpleAccent
      )         
        );
  }
}
