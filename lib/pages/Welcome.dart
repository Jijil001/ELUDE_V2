import 'package:flutter/material.dart';
import 'package:untitled1/pages/login.dart';
import 'package:untitled1/pages/signupgage.dart';

class Welcome extends StatefulWidget {
  // const Welcome({super.key, Key? key});

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
          const Expanded(
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
          SizedBox(
            width: double.infinity, // Expand the buttons to full width
            child: Column(
              children: [
                Container(
                  width: double.infinity, // Expand the button to full width
                  height: 60, // Set the height of the button
                  margin:
                      const EdgeInsets.all(10), // Add margin around the button
                  child: ElevatedButton(
                    onPressed: () {
                      // Get Started button logic
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const signuppage();
                          },
                        ),
                      ); // Add your code here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .orange, // Set button background color to orange
                    ),
                    child: const Text('Get Started',
                        style: TextStyle(fontSize: 18)),
                  ),
                ),
                Container(
                  width: double.infinity, // Expand the button to full width
                  height: 60, // Set the height of the button
                  margin:
                      const EdgeInsets.all(10), // Add margin around the button
                  child: ElevatedButton(
                    onPressed: () {
                      // Already have an account button logic
                      // Add your code here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const loginPage();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .transparent, // Set button background color to transparent
                      side: const BorderSide(
                          color: Colors
                              .orange), // Set button border color to orange
                    ),
                    child: const Text('Already have an account',
                        style: TextStyle(fontSize: 18, color: Colors.orange)),
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
