import 'package:flutter/material.dart';
import 'package:shop_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: "Shoes App",
      theme: ThemeData(
          fontFamily: "Lato",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          primaryColor:  Colors.yellow,
          inputDecorationTheme:const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromARGB(255, 148, 145, 145),
          )),
      home: HomePage(),
    );
  }
}
