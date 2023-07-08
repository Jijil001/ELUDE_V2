import 'package:flutter/material.dart';

class SelectGenre extends StatefulWidget {
  const SelectGenre({super.key});

  @override
  _SelectGenreState createState() => _SelectGenreState();
}

class _SelectGenreState extends State<SelectGenre> {
  
  List<int> _selectedChipIndexes = [];

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
                    text: 'Genre',
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
