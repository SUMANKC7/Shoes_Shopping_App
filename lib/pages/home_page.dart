import 'package:flutter/material.dart';
import 'package:shop_app/pages/cart_page.dart';

import 'package:shop_app/pages/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = const[
    ProductList(),
    CartPage(),
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          iconSize: 35,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          ],
        ),
      ),
    );
  }
}