import 'package:ccpd_application/View/JobPosting.dart';
import 'package:ccpd_application/View/RegistrationPages/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Controllers/Utils.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

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
            SizedBox(height: 20),
            Text(
              'Welcome Back!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(child: Container()),
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
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
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
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        controller: passwordController,
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
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _auth
                    .signInWithEmailAndPassword(
                        email: emailController.text.toString(),
                        password: passwordController.text.toString())
                    .then((value) {
                  Utils.toastMessage(value.user!.email.toString());
                  print(emailController.text.toString());
                  print(passwordController.text.toString());

                  print("User logged in successfully");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => JobPosting()));
                }).onError((error, stackTrace) {
                  debugPrint(error.toString());
                  Utils.toastMessage(error.toString());
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF7583CA),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'LOG IN',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Forgot Password?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: Text(
                "DON'T HAVE AN ACCOUNT? SIGN UP",
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
