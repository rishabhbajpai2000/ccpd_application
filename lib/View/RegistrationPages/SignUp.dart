import 'package:ccpd_application/Controllers/LoginSignUpServices.dart';
import 'package:ccpd_application/View/JobPosting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../Controllers/Utils.dart';
import 'InitialWelcomeScreen.dart';
import 'package:ccpd_application/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'loginPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  final fireStore = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
                Expanded(child: Container()),
                Image.asset(
                  "assets/abes_logo.png",
                  width: 100, // Adjust the width as needed
                  height: 100, // Adjust the height as needed
                ),
              ],
            ),
            Text(
              'Create your account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Container(),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                signUp(
                    context: context,
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
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
            Expanded(flex: 6, child: Container()),
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
    );
  }
}
