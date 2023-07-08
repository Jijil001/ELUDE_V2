import 'package:flutter/material.dart';
import 'package:untitled1/pages/trail.dart';


class Recoverpass extends StatefulWidget {
  const Recoverpass({Key? key});

  @override
  State<Recoverpass> createState() => _RecoverpassState();
}

class _RecoverpassState extends State<Recoverpass> {
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
                text: 'Recover',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                children: <TextSpan>[
                  TextSpan(
                    text: ' password',
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
            ElevatedButton(
              onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                        return Trail();
                      },),);   // Add your login logic here
              },
              child: Text('Continue'),
            ),
           
          ],
        ),
      ),
    );
  }
}
