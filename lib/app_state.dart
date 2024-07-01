import 'dart:async';     
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

import 'package:flutter/material.dart';

import 'firebase_options.dart';

//local user import
import './classes/user.dart' as cl_user;

import 'package:cloud_firestore/cloud_firestore.dart';
final db = FirebaseFirestore.instance;
//Database References
final usersRef = db.collection('Users');

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  // ignore: prefer_const_constructors
  cl_user.User _lUser = cl_user.User(name: "AppStateFailed",houseID: "AppStateID",order: 1);
  cl_user.User get lUser => _lUser;

  Stream<bool> get authStateChanges 
  => FirebaseAuth.instance.authStateChanges().map((user) => user != null);
  


  Future<void> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loggedIn = true;
        //gets user from DB
        DocumentReference<Map<String, dynamic>> testDoc = usersRef.doc(user.uid);
        testDoc.get().then((value) => {
              _lUser = cl_user.User(name: value['name'],houseID: value['houseID'],order: value['order'])
            });        
      } else {
        _loggedIn = false;
      }
      notifyListeners();
    });
  }
}