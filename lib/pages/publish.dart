import 'package:flutter/material.dart';
import 'package:untitled1/pages/selectgenre.dart';

class Publish extends StatefulWidget {
  const Publish({Key? key});

  @override
  State<Publish> createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  String content = '';
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text.rich(
              TextSpan(
                text: 'Welcome ',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Writer',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 165, 0),
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                maxLines: 1,
                style: const TextStyle(fontSize: 20),
                onChanged: (text) {
                  setState(() {
                    content = text;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Name of the book',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  maxLines: 200,
                  style: const TextStyle(fontSize: 20),
                  onChanged: (text) {
                    setState(() {
                      content = text;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Start writing...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange, // Set button background color to orange
                ),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                        return SelectGenre();
                      },),);   // Continue button logic
                  // Add your code here
                },
                child: const Text('Continue'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
