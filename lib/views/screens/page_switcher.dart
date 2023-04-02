import 'package:flutter/material.dart';
import 'package:odisserr/views/screens/Perfil.dart';
import 'package:odisserr/views/screens/gameView.dart';
import 'package:odisserr/views/screens/newHome.dart';
import 'package:odisserr/views/screens/profile.dart';
import 'package:odisserr/views/utils/AppColor.dart';
import 'package:odisserr/views/widgets/custom_bottom_navigation_bar.dart';

class PageSwitcher extends StatefulWidget {
  @override
  _PageSwitcherState createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  int _selectedIndex = 0;

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          [NewHome(), Perfil(), GameView(), Profile()][_selectedIndex],
          BottomGradientWidget(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
    );
  }
}

class BottomGradientWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 24, 58, 168).withOpacity(0.2), 
            Color.fromARGB(255, 24, 58, 168).withOpacity(0)], 
            begin: Alignment.bottomCenter, 
            end: Alignment.topCenter)
      ))
    );
  }
}
