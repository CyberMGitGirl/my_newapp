import 'package:my_newapp/pages/contact_page.dart';
import 'package:my_newapp/pages/home_page.dart'; 
import 'package:my_newapp/pages/profile_page.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int indexToBeShown = 1;
  var pages = [HomePage(), ContactPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexToBeShown],                                             //Take note that IndexedStack is an alternative
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexToBeShown,
        onTap: (newIndex) {
          setState(() {
            indexToBeShown = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home),),
          BottomNavigationBarItem(label: "Contact", icon: Icon(Icons.call),),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person),),
        ],
      ),
    );
  }
}
