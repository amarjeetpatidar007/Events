import 'package:flutter/material.dart';
import 'package:local_events/pages/homepage/home_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Local Events App",
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFFFF4700),
      ),
      home: const HomePage(),
    );
  }
}
