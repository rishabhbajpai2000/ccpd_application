import 'package:ccpd_application/View/Registration%20Pages/loginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'initial_welcome_screen.dart';
import 'package:ccpd_application/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({Key? key}) : super(key: key);

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  // final _formKey = GlobalKey<FormState>();
  // final nameController = TextEditingController();
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  // FirebaseAuth _auth = FirebaseAuth.instance;
  //
  // final fireStore = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Create your account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),

                  // Form(
                  //   key: _formKey,
                  //   child: Column(
                  //     children: <Widget>[
                  //       TextFormField(
                  //         keyboardType: TextInputType.name,
                  //         controller: nameController,
                  //         decoration: const InputDecoration(
                  //           hintText: 'Name',
                  //           prefixIcon: Icon(Icons.person),
                  //         ),
                  //         validator: (value) {
                  //           if (value!.isEmpty) {
                  //             return 'Enter Name';
                  //           }
                  //           return null;
                  //         },
                  //       ),
                  //       SizedBox(
                  //         height: 10,
                  //       ),
                  //       TextFormField(
                  //         keyboardType: TextInputType.emailAddress,
                  //         controller: emailController,
                  //         decoration: const InputDecoration(
                  //           hintText: 'Email',
                  //           prefixIcon: Icon(Icons.alternate_email),
                  //         ),
                  //         validator: (value) {
                  //           if (value!.isEmpty) {
                  //             return 'Enter Email';
                  //           }
                  //           return null;
                  //         },
                  //       ),
                  //       SizedBox(
                  //         height: 10,
                  //       ),
                  //       TextFormField(
                  //         keyboardType: TextInputType.text,
                  //         controller: passwordController,
                  //         obscureText: true,
                  //         decoration: const InputDecoration(
                  //           hintText: 'Password',
                  //           prefixIcon: Icon(Icons.lock_open),
                  //         ),
                  //         validator: (value) {
                  //           if (value!.isEmpty) {
                  //             return 'Enter password';
                  //           }
                  //           return null;
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  // GestureDetector(
                  //   onTap: () {
                  //     // creating a new user with email and password
                  //     FirebaseAuth.instance
                  //         .createUserWithEmailAndPassword(
                  //         email: emailController.text.toString(),
                  //         password: passwordController.text.toString())
                  //         .then((value) {
                  //
                  //       print("new user created successfully");
                  //       Utils().toastMessage("new user created successfully");
                  //
                  //       // Now we are adding the user data to the firestore database.
                  //       String id = value.user!.uid.toString();
                  //       fireStore.doc(id.toString()).set({
                  //         "Name": nameController.text.toString(),
                  //         "Email": emailController.text.toString(),
                  //         "UserId": id,
                  //         "LikedAdvices": "no advice liked yet",
                  //       }).then((value) {
                  //         print("User Added Successfully");
                  //         Utils().toastMessage("User Added Successfully");
                  //       }).onError((error, stackTrace) {
                  //         print("Error: ${error.toString()}");
                  //         Utils().toastMessage("Error: ${error.toString()}");
                  //       });
                  //
                  //
                  //       return Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => welcomePage()));
                  //     }).catchError((error, stackTrace) {
                  //       Utils().toastMessage(error.toString());
                  //       // print("error,${error.toString()} ")
                  //     });
                  //
                  //
                  //   },
                  //   child: Container(
                  //     width: MediaQuery.of(context).size.width * 0.6,
                  //     height: 40,
                  //     decoration: BoxDecoration(
                  //       color: Color(0xFF7583CA),
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         'GET STARTED',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //
                  //   ),),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => signUpPage()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFF7583CA),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'GET STARTED',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => loginPage()));
                    },
                    child: Text(
                      "ALREADY HAVE AN ACCOUNT? LOG IN",
                      style: TextStyle(
                        color: Color(0xFFA1A4B2),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
