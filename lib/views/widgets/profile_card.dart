import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class ProfileCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.all(20),
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(
              spreadRadius: 1,
              blurRadius: 5,
              color: Colors.black12,
              offset: Offset(5,5)
            )],
            gradient: LinearGradient(colors: [Colors.green, Colors.blue],
             begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      image: DecorationImage(image: AssetImage('assets/images/profile2.jpg'), fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nombre",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              Text(
                                "Cali, Valle del Cauca",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          )),
                      Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nivel",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              Text(
                                "Explorador Junior",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          )),
                      Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ubicacion",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              Text(
                                "Cali, Valle del Cauca",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ))
                    ],
                  ))
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5)),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(colors: [Color.fromARGB(0, 255, 255, 255), Color.fromARGB(52, 255, 255, 255), Color.fromARGB(0, 255, 255, 255)]),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                    Icon(Icons.bookmark_outlined,color: Colors.white),
                    Icon(Icons.celebration_sharp,color: Colors.white),
                    Icon(Icons.diamond,color: Colors.white),
                    Icon(Icons.looks,color: Colors.white)
                  ]),
                  )
                  
            ],
          )),
    );
  }
}
