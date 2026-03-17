import 'package:flutter/material.dart';
import 'package:shop_app/cart_managing_page.dart';
import 'package:shop_app/home_product_list.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  int selectedpage = 0;
  List<Widget> pages= const[homebody(),cartpage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IndexedStack(
        
        index: selectedpage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        
        onTap: (value) {
          setState(() {
            selectedpage = value;
          });
        },
        currentIndex: selectedpage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),

          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        ],
      ),
    );
  }
}
