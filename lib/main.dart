import 'package:bedha_chhua/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:bedha_chhua/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bedha Chhua',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: AuthPage(),
      //const HomePage(title: 'Bedha Chhua'),
      debugShowCheckedModeBanner: false,
    );
  }
}