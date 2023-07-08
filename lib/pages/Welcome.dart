import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled1/pages/login.dart';
import 'package:untitled1/pages/signupgage.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String content = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'ELUDE',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 165, 0),
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity, // Expand the buttons to full width
            child: Column(
              children: [
                Container(
                  width: double.infinity, // Expand the button to full width
                  height: 60, // Set the height of the button
                  margin: const EdgeInsets.all(10), // Add margin around the button
                  child: ElevatedButton(
                    onPressed: () {
                      // Get Started button logic
                     Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                        return signuppage();
                      },),); // Add your code here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange, // Set button background color to orange
                    ),
                    child: Text('Get Started', style: TextStyle(fontSize: 18)),
                  ),
                ),
                Container(
                  width: double.infinity, // Expand the button to full width
                  height: 60, // Set the height of the button
                  margin: const EdgeInsets.all(10), // Add margin around the button
                  child: ElevatedButton(
                    onPressed: () {
                      // Already have an account button logic
                      // Add your code here
                      Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                        return loginPage();
                      },),);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // Set button background color to transparent
                      side: BorderSide(color: Colors.orange), // Set button border color to orange
                    ),
                    child: Text('Already have an account', style: TextStyle(fontSize: 18, color: Colors.orange)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
