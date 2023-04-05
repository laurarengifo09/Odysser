import 'package:flutter/material.dart';
import 'package:odisserr/views/screens/page_camera.dart';
import 'package:odisserr/views/screens/page_maps.dart';
import 'package:odisserr/views/screens/profile.dart';
import 'package:odisserr/views/widgets/custom_post.dart';
import 'package:odisserr/views/widgets/my_custom_post.dart';

import '../widgets/profile_card.dart';


class Profile extends StatelessWidget {
  final List list = [
    [Color.fromARGB(255, 9, 117, 150), 14, 'profile(6).jpg', 320, 20],
    [Colors.orange[700], 9, 'myPost(4).jpg', 200, 10],
    [Color.fromARGB(255, 105, 91, 11), 12, 'myPost(2).jpg', 180, 23],
    [Color.fromARGB(255, 47, 102, 33), 13, 'myPost(3).jpg', 400, 100],
    [Color.fromARGB(255, 9, 117, 150), 14, 'myPost(1).jpg', 219, 17],
    [Color.fromARGB(255, 14, 150, 9), 15, 'myPost(5).jpg', 30, 12],
    [Color.fromARGB(255, 14, 150, 9), 15, 'myPost(6).jpg', 50, 21],
    [Color.fromARGB(255, 105, 91, 11), 12, 'myPost(7).jpg', 144, 90],
  ];
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
        leadingWidth: 100,
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.map_sharp, color: Colors.white),
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageMaps()));
              },
            ),
            IconButton(
              icon: Icon(Icons.camera_alt_rounded, color: Colors.white),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageCamera()));
              },
            ),
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(100)
              ),
              child: Row(
                children: [
                Image.asset(
                  'assets/images/coin_detailess.png',
                  height: 25,
                ),
                SizedBox(width: 5),
                Text("200000")
              ]),
          ))
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
                  child: Text("MY POSTS", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 14, 61, 148))),
                ),
                Container(
                  child: GridView.count(
                            shrinkWrap: true,                 
                            crossAxisCount: 2,
                            physics: AlwaysScrollableScrollPhysics(),
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.6,
                            children: List.generate(list.length, (index) {
                              return MyCustomPost(
                                width: 150, height:150, 
                                color: list[index][0],number: list[index][1],image: list[index][2],
                                likes: list[index][3],comments: list[index][4],);
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
