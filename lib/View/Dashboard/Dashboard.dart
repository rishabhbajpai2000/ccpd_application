import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'CCPD Dashboard',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
              Image.asset(
                "assets/abes_logo.png",
                width: 100, // Adjust the width as needed
                height: 100, // Adjust the height as needed
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
