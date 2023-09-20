import 'package:ccpd_application/View/Registration%20Pages/signUp.dart';
import 'package:flutter/material.dart';
import 'package:ccpd_application/main.dart';

class initial_welcome_screen extends StatefulWidget {
  const initial_welcome_screen({super.key});

  @override
  State<initial_welcome_screen> createState() => _initial_welcome_screenState();
}

class _initial_welcome_screenState extends State<initial_welcome_screen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Campus Ease",
                    style: TextStyle(
                      color: Color(0xFF8E97FD),
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    )),
                Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.asset(
                        "assets/abes_logo.png",
                        width: 100, // Adjust the width as needed
                        height: 100, // Adjust the height as needed
                      ),]),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20), // Adjust the border radius as needed
              child: Image.asset(
                "assets/initial_screen_image.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "We are what we do",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20, 20.0, 20),
              child: Text(
                "The CCPD App: Job postings and student insights in one place.",
                style: TextStyle(
                  color: Color(0xFFA1A4B2),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
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
                    'SIGN UP',
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
                    MaterialPageRoute(builder: (context) => signUpPage()));
              },
              child: Text(
                "ALREADY HAVE AN ACCOUNT? LOG IN",
                style: TextStyle(
                  color: Color(0xFFA1A4B2),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
