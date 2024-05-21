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
void main() async {
  // Ensuring Widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initializing Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Turn off the # in the URLs on the web
  usePathUrlStrategy();

  // Run the app with ChangeNotifierProvider for ApplicationState
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, child) => const Roomies(),
    ),
  );
}

class Roomies extends StatelessWidget {
  const Roomies({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<ApplicationState>(context);

    return MaterialApp.router(
      title: "Roomies",
      routerConfig: createRouter(appState),
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