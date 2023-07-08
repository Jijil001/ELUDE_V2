import 'package:flutter/material.dart';
import 'package:untitled1/pages/about.dart';
import 'package:untitled1/pages/faq1.dart';
import 'package:untitled1/pages/publish.dart';

void main() {
  runApp(Trail());
}

class Trail extends StatefulWidget {
  const Trail({Key? key});

  @override
  State<Trail> createState() => _TrailState();
}

class _TrailState extends State<Trail> {
  bool isDarkMode = true;
  bool isEyeProtectionEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            title: Text(
              'Good Afternoon',
              style: TextStyle(color: Colors.orange),
            ),
            leading: PopupMenuButton<String>(
              icon: Icon(Icons.menu),
              onSelected: (value) {
                if (value == 'theme') {
                  setState(() {
                    isDarkMode = !isDarkMode;
                  });
                } else if (value == 'eye_protection') {
                  setState(() {
                    isEyeProtectionEnabled = !isEyeProtectionEnabled;
                  });
                } else if (value == 'about') {
                  showAboutDialog(context);
                } else if (value == 'faq') {
                  showFAQDialog(context);
                } else if (value == 'publish') {
                  publishactivity(context);
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<String>(
                  value: 'theme',
                  child: ListTile(
                    leading: Icon(
                      isDarkMode ? Icons.dark_mode : Icons.light_mode,
                      size: 24,
                    ),
                    title: Text(
                      isDarkMode ? 'Dark Mode' : 'Light Mode',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'eye_protection',
                  child: ListTile(
                    leading: Icon(
                      isEyeProtectionEnabled
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 24,
                    ),
                    title: Text(
                      isEyeProtectionEnabled
                          ? 'Eye Protection On'
                          : 'Eye Protection Off',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'about',
                  child: Text(
                    'About',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'faq',
                  child: Text(
                    'FAQ',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'publish',
                  child: Text(
                    'Publish New Work',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 220, 128, 8),
                ),
                onPressed: () {
                  // Handle the action of the action button
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => BookCard(
            title: 'Book ${index + 1}',
            author: 'Author ${index + 1}',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return PDFScreen(); // Replace PDFScreen with your actual PDF screen widget
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final VoidCallback onTap;

  const BookCard({
    Key? key,
    required this.title,
    required this.author,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(title),
        subtitle: Text(author),
        onTap: onTap,
      ),
    );
  }
}

class PDFScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement your PDF screen UI here
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: Center(
        child: Text('hello'),
      ),
    );
  }
}

void showAboutDialog(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) {
        return AboutPage();
      },
    ),
  );
}

void showFAQDialog(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) {
        return FAQPage();
      },
    ),
  );
}




void publishactivity(BuildContext context) {
 onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                        return const Publish();
                      },),);   // Add your login logic here
              };
}
