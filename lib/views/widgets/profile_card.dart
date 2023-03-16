import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odisserr/models/core/recipe.dart';
import 'package:odisserr/views/screens/recipe_detail_page.dart';

class ProfileCard extends StatelessWidget {
  final Recipe data;
  ProfileCard({@required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RecipeDetailPage(data: data)));
      },
      // Card Wrapper
      child: Container(
          width: 400,
          height: 200,
          alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),

          // Recipe Card Info
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 160,
                height: 160,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
              ),
              Container(
                  child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ubicacion",
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            "Cali, Valle del Cauca",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ubicacion",
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            "Cali, Valle del Cauca",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ubicacion",
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            "Cali, Valle del Cauca",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ))
                ],
              ))
            ],
          )),
    );
  }
}
