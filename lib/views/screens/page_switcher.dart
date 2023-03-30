import 'package:flutter/material.dart';
import 'package:odisserr/views/screens/Perfil.dart';
import 'package:odisserr/views/screens/bookmarks_page.dart';
import 'package:odisserr/views/screens/explore_page.dart';
import 'package:odisserr/views/screens/home_page.dart';
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
          [NewHome(), Perfil(), BookmarksPage(), Profile()][_selectedIndex],
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
        height: 150,
        decoration: BoxDecoration(gradient: AppColor.bottomShadow),
      ),
    );
  }
}
