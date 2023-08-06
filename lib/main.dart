// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled1/pages/about.dart';
import 'package:untitled1/pages/bookreadwindow.dart';
import 'package:untitled1/pages/faq1.dart';
import 'package:untitled1/pages/login.dart';
import 'package:untitled1/pages/publish.dart';
import 'package:untitled1/pages/publishgenre.dart';
import 'package:untitled1/pages/recoverpass.dart';
import 'package:untitled1/pages/selectgenre.dart';
import 'package:untitled1/pages/signupgage.dart';
import 'package:untitled1/pages/userselection.dart';
// import 'package:untitled1/pages/about.dart';
// import 'package:untitled1/pages/login.dart';
// import 'package:untitled1/pages/publishgenre.dart';
// import 'package:untitled1/pages/selectgenre.dart';
// import 'package:untitled1/pages/signupgage.dart';
import 'package:untitled1/pages/test.dart';
import 'package:untitled1/pages/trail.dart';
// import 'package:untitled1/pages/userselection.dart';
// import 'package:untitled1/pages/publish.dart';
// import 'package:untitled1/pages/bookreadwindow.dart';
import 'package:untitled1/pages/welcome.dart';
// import 'package:untitled1/pages/faq1.dart';
// import 'package:untitled1/pages/recoverpass.dart';
// import 'package:untitled1/pages/fileupload.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Trail(),
      ),
    );
  }
}
