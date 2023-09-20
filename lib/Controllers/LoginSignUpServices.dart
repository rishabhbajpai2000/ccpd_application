import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../View/JobPosting.dart';
import 'Utils.dart';

void signUp(
    {required BuildContext context,
    required String name,
    required String email,
    required String password}) {
  final fireStore = FirebaseFirestore.instance.collection('users');
  // creating a new user with email and password
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((value) {
    print("new user created successfully");
    Utils.toastMessage("new user created successfully");

    // Now we are adding the user data to the firestore database.
    String id = value.user!.uid.toString();
    fireStore.doc(id.toString()).set({
      "Name": name,
      "Email": email,
      "UserId": id,
    }).then((value) {
      print("User Added Successfully");
      Utils.toastMessage("User Added Successfully");
    }).onError((error, stackTrace) {
      print("Error: ${error.toString()}");
      Utils.toastMessage("Error: ${error.toString()}");
    });

    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => JobPosting()));
  }).catchError((error, stackTrace) {
    Utils.toastMessage(error.toString());
  });
}
