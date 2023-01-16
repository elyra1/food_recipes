import 'package:flutter/material.dart';
import 'package:food_recepies/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
