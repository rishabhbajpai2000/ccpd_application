import 'package:ccpd_application/View/HomePage.dart';
import 'package:ccpd_application/View/JobPosting.dart';
import 'package:ccpd_application/View/RegistrationPages/InitialWelcomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  isLogin();
}



void isLogin() {
  final auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: user == null ? InitialWelcomeScreen() : HomePage(),
    routes: {
      'initial_Welcome_Screen': (context) => InitialWelcomeScreen(),
    },
  ));
}
