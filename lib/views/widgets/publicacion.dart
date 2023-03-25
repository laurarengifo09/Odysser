import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odisserr/models/core/recipe.dart';
import 'package:odisserr/views/screens/recipe_detail_page.dart';

class Publicacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 214, 214, 214)], 
      begin: Alignment.bottomCenter, end: Alignment.topCenter),
      boxShadow: [BoxShadow(
              spreadRadius: 1,
              blurRadius: 10,
              color: Colors.black12,
              offset: Offset(2,2)
            )]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          margin: EdgeInsets.all(15),
          height: 150,
          decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(5))
        ),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Container(
                margin: EdgeInsets.only(left: 40),
                child:                     
                  Icon(
                    Icons.favorite,
                    size: 25,)),
              Spacer(),
              Container(
                child:                     
                  Icon(
                    Icons.location_on_rounded,
                    size: 25,)),
              Spacer(),
              Container(
                margin: EdgeInsets.only(right: 40),
                child:                     
                  Icon(
                    Icons.add_comment,
                    size: 25,)),
            ]),
          ),
      ],)         
      );
  }
}


