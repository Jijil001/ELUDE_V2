import 'package:flutter/material.dart';

class Publish2 extends StatefulWidget {
  const Publish2({Key? key}) : super(key: key);

  @override
  _Publish2State createState() => _Publish2State();
}

class _Publish2State extends State<Publish2> {
  List<int> _selectedChipIndexes = [];
  late bool _isContent18Plus; // Variable to track if content is 18+

  final List<String> _genres = [
    'Thriller',
    'Romance',
    'Fiction',
    'Novel',
    'Narrative',
    'Non-fiction',
    'Mystery',
    'Horror',
    'Childrens literature',
    'Sci-fiction',
    'History',
    'Poetry',
    'Biography',
    'Autobiography',
    'Cookbook',
    'Crime',
    'Historical Fiction',
  ];

  @override
  void initState() {
    super.initState();
    _isContent18Plus = false; // Set initial value of _isContent18Plus
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text.rich(
              TextSpan(
                text: 'Select ',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Genre of Book',
                    style: TextStyle(
                      color: Color.fromARGB(219, 255, 166, 0),
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 8.0,
                children: List<Widget>.generate(_genres.length, (int index) {
                  return ChoiceChip(
                    label: Text(_genres[index]),
                    selected: _selectedChipIndexes.contains(index),
                    selectedColor: Colors.orange,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          if (_selectedChipIndexes.length < 3) {
                            _selectedChipIndexes.add(index);
                          }
                        } else {
                          _selectedChipIndexes.remove(index);
                        }
                      });
                    },
                  );
                }),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Is your content 18+?',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isContent18Plus = true;
                    });
                  },
                  child: Text('Yes'),
                  style: ElevatedButton.styleFrom(
                    primary: _isContent18Plus ? Colors.orange : null,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isContent18Plus = false;
                    });
                  },
                  child: Text('No'),
                  style: ElevatedButton.styleFrom(
                    primary: !_isContent18Plus ? Colors.orange : null,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Continue button action
              },
              child: Text('Continue'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
