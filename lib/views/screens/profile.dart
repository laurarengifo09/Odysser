import 'package:flutter/material.dart';
import 'package:odisserr/models/core/recipe.dart';
import 'package:odisserr/views/screens/profile.dart';
import 'package:odisserr/views/widgets/custom_post.dart';
import 'package:odisserr/views/widgets/my_custom_post.dart';

import '../widgets/profile_card.dart';

class Profile extends StatelessWidget {
  final List list = [1,2,3,4,5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 14, 61, 148),Color.fromARGB(255, 26, 99, 209)]))),
        brightness: Brightness.dark,
        elevation: 0,
        centerTitle: true,
        title: Text('ODYSSER',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        leading: 
          IconButton(
              icon: Icon(Icons.map_sharp, color: Colors.white),
              onPressed: () {
              },
            )
        ,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              icon: Icon(Icons.camera_alt_rounded, color: Colors.white),
              onPressed: () {
              },
            ),
          )
        ],
      ),
    
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          // Section 1 - Featured Recipe - Wrapper
          Container(
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 14, 61, 148),Color.fromARGB(255, 26, 99, 209)])),
                ),
                // Section 1 - Content
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Text("MY DATA", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: ProfileCard()
                    ),
                  ],
                )
              ],
            ),
          ),

          // Section 2 - Recommendation Recipe
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 5),
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("MY POSTS", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
                ),
                Container(
                  child: GridView.count(
                            shrinkWrap: true,                 
                            crossAxisCount: 2,
                            physics: BouncingScrollPhysics(),
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 5,
                            children: List.generate(list.length, (index) {
                              return MyCustomPost(width: 200, height: 200);
                            }),
                    ),
                ),
              ]
              ),
          )
        ],
      ),
    );
  }
}
