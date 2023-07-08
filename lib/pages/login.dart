import 'package:flutter/material.dart';
import 'package:untitled1/pages/trail.dart';


class loginPage extends StatefulWidget {
  const loginPage({Key? key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                text: 'Log',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                children: <TextSpan>[
                  TextSpan(
                    text: 'in',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 165, 0),
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                        return Trail();
                      },),);   // Add your login logic here
              },
              child: Text('Continue'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
 // Add forgot password logic here
              },
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}
