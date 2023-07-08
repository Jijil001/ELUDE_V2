import 'package:flutter/material.dart';

class ReadingWindow extends StatelessWidget {
  const ReadingWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: Text('Back'), // Display "Back" near the back button
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.orange), // Set font color to orange
                    decoration: InputDecoration(
                      labelText: 'How did you feel after reading?',
                      labelStyle: TextStyle(color: Colors.orange), // Set label color to orange
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement submit button functionality
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange, // Set button background color to orange
                  ),
                  child: Text('Submit', style: TextStyle(color: Colors.white)), // Set button text color to white
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
