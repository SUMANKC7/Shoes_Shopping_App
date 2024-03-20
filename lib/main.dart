import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

import 'package:shop_app/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: "Shoes App",
        theme: ThemeData(
            fontFamily: "Lato",
            colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 253, 236, 83),
            primary: const Color.fromARGB(255, 253, 236, 83)
            ),
            appBarTheme:const  AppBarTheme(
              titleTextStyle: TextStyle(
                fontSize:20,color: Colors.black 
              )
            ),
           
            inputDecorationTheme:const InputDecorationTheme(
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              prefixIconColor: Color.fromARGB(255, 148, 145, 145),
            ),
            textTheme:const TextTheme(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                ),
                bodySmall:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  
                ), 
            ),
            ),
        home:  HomePage(),
      ),
    );
  }
}
