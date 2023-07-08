import 'package:flutter/material.dart';
import 'package:untitled1/pages/trail.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            FAQItem(
              question: 'Question 1',
              answer: 'Answer to question 1',
            ),
            SizedBox(height: 10),
            FAQItem(
              question: 'Question 2',
              answer: 'Answer to question 2',
            ),
            SizedBox(height: 10),
            FAQItem(
              question: 'Question 3',
              answer: 'Answer to question 3',
            ),
            // Add more FAQItems as needed
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  State<FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        collapsedTextColor: Colors.black,
        textColor: Colors.black,
        collapsedBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        onExpansionChanged: (expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(widget.answer),
          ),
        ],
      ),
    );
  }
}
