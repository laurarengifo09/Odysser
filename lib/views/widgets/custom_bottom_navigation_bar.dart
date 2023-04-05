import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


// ignore: must_be_immutable
class CustomBottomNavigationBar extends StatefulWidget {
  int selectedIndex;
  Function onItemTapped;
  CustomBottomNavigationBar(
      {@required this.selectedIndex, @required this.onItemTapped});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 60, right: 60, bottom: 20),
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            currentIndex: widget.selectedIndex,
            onTap: widget.onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            items: [
              (widget.selectedIndex == 0)
                  ? BottomNavigationBarItem(
                      icon: Icon(Icons.supervised_user_circle_rounded,
                          color: Color.fromARGB(255, 15, 44, 124), size: 30),
                      label: '')
                  : BottomNavigationBarItem(
                      icon: Icon(Icons.supervised_user_circle_outlined,
                          color: Colors.grey[600], size: 30),
                      label: ''),
              (widget.selectedIndex == 1)
                  ? BottomNavigationBarItem(
                      icon: Icon(Icons.explore,
                          color: Color.fromARGB(255, 15, 44, 124), size: 30),
                      label: '')
                  : BottomNavigationBarItem(
                      icon: Icon(Icons.explore_outlined,
                          color: Colors.grey[600], size: 30),
                      label: ''),
              (widget.selectedIndex == 2)
                  ? BottomNavigationBarItem(
                      icon: Icon(Icons.play_circle_fill_rounded,
                          color: Color.fromARGB(255, 15, 44, 124), size: 30),
                      label: '')
                  : BottomNavigationBarItem(
                      icon: Icon(Icons.play_circle_outline_rounded,
                          color: Colors.grey[600], size: 30),
                      label: ''),
              (widget.selectedIndex == 3)
                  ? BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle_outlined,
                          color: Color.fromARGB(255, 15, 44, 124), size: 30),
                      label: '')
                  : BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle_outlined,
                          color: Colors.grey[600], size: 30),
                      label: ''),
            ],
          ),
        ),
      ),
    );
  }
}
