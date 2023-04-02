import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomEvent extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget redirect;
  final List<Color> listColors;

  CustomEvent({@required this.title, @required this.icon, @required this.redirect, @required this.listColors});

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: 300,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 5),
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Color.fromARGB(20, 0, 0, 0),
                      blurRadius: 5,
                      spreadRadius: 3,
                      offset: Offset(2,2)
                    )],
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: listColors)
                  ),
                  child:
                    Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                      Spacer(),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Icon(icon, size: 100, color: Colors.white),
                      )
                    ]),
                );
              
  }
}
