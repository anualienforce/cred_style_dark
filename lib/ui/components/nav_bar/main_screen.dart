import 'package:dark_cred/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'custom_bottom_nav_bar.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    EventScreen(),
    TvScreen(),
    FavScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children:[ _screens[_selectedIndex],
        Positioned(
          // Position it at the bottom
          bottom: 20.0, // Adjust this value for margin from bottom
          left: 0,
          right: 0,
          child: Center( // Use Center to horizontally center the nav bar
            child: CustomBottomNavBar(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
          ),
        ),

      ]),
      // bottomNavigationBar: Container(
      //   width: 250,
      //   child: CustomBottomNavBar(
      //     selectedIndex: _selectedIndex,
      //     onItemTapped: _onItemTapped,
      //   ),
      // ),
    );
  }
}