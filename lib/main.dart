//Login Functionality

import 'package:flutter/material.dart';              // new
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';                 // new
import 'app_state.dart';   
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
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: ((context, child) => const Roomies()),
  ));
}

class Roomies extends StatelessWidget {
  const Roomies({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title:"Roomies",
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple,
            ),
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),         
        );
  }
}
