import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'initial_welcome_screen.dart';
import 'package:ccpd_application/main.dart';
import 'signUp.dart';


class loginPage extends StatefulWidget {
  const loginPage({Key? key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  // final _formKey = GlobalKey<FormState>();
  // final nameController = TextEditingController();
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  // FirebaseAuth _auth = FirebaseAuth.instance;

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
                    'Welcome Back!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 40),
                  // Form(
                  //   key: _formKey,
                  //   child: Column(
                  //     children: <Widget>[
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
                  //         obscureText: true,
                  //         keyboardType: TextInputType.text,
                  //         controller: passwordController,
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
                  //     _auth
                  //         .signInWithEmailAndPassword(
                  //         email: emailController.text.toString(), password: passwordController.text.toString())
                  //         .then((value) {
                  //       Utils().toastMessage(value.user!.email.toString());
                  //       print(emailController.text.toString());
                  //       print(passwordController.text.toString());
                  //
                  //       print("User logged in successfully");
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => welcomePage()));
                  //     }).onError((error, stackTrace) {
                  //       debugPrint(error.toString());
                  //       Utils().toastMessage(error.toString());
                  //     });
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
                  //         'LOG IN',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signUpPage()));
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
          ],
        ),
      ),
    );
  }
}