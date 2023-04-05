import 'dart:math';

import 'package:flutter/material.dart';
import 'package:odisserr/views/screens/page_camera.dart';
import 'package:odisserr/views/screens/page_help.dart';
import 'package:odisserr/views/screens/page_maps.dart';
import 'package:odisserr/views/widgets/custom_event.dart';
import 'package:odisserr/views/widgets/custom_post.dart';


class NewHome extends StatefulWidget{

  int coins;

  NewHome({this.coins = 200000});

  @override
  NewHomeState createState() => NewHomeState(coins: coins);
}


class NewHomeState extends State<NewHome> {

  int coins;

  NewHomeState({this.coins = 200000});

  TextEditingController searchInputController = TextEditingController();
  List<Widget> listEvents = [
    CustomEvent(title: 'Event', icon: Icons.event_note, redirect: Text("a"), listColors: [Colors.red, Colors.orange]),
    CustomEvent(title: 'News', icon: Icons.newspaper, redirect: Text("a"), listColors: [Colors.green, Colors.lightBlue[600]]),
    CustomEvent(title: 'Trends', icon: Icons.trending_up_sharp, redirect: Text("a"), listColors: [Colors.purple, Colors.pink]),
    CustomEvent(title: 'Challenges', icon: Icons.track_changes, redirect: Text("a"), listColors: [Colors.amber, Color.fromARGB(255, 125, 143, 24)]),
  ];



  List posts = [
    ['@01nanii.xd','profile(1).jpg',2,'Budapest, Hungary', Color.fromARGB(255, 119, 94, 21), 232, 10, 'post(6).jpg'],
    ['@niko.kpolo','profile(5).jpg',4,'Madrid, Spain', Color.fromARGB(255, 134, 12, 12), 119, 20, 'post(3).jpg'],
    ['@rodrigorafa_mora','profile(2).jpg',13,'Cali, Colombia', Color.fromARGB(255, 3, 90, 42), 100, 70, 'post(2).jpg'],
    ['@s_rengifo.97','profile(6).jpg',14,'London, England', Color.fromARGB(255, 9, 117, 150), 319, 20, 'post(1).jpg'],
    ['@jdepap2','profile(4).jpg',2,'Villavicencio, Colombia', Color.fromARGB(255, 119, 94, 21), 150, 12, 'post(5).jpg'],
    ['@nicol_paz09','profile(3).jpg',6,'Seul, South Korea', Color.fromARGB(255, 1, 155, 202), 96, 30, 'post(4).jpg'],
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 14, 61, 148),Color.fromARGB(255, 26, 99, 209)]))),
        brightness: Brightness.dark,
        elevation: 0,
        centerTitle: true,
        title: Text('',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        leadingWidth: 200,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            IconButton(
              icon: Icon(Icons.help, color: Colors.white),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageHelp()));
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
                Text("$coins")
              ]),
          ))
        ],
      ),
    
    body: Column(
      children: [
        Container(
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 14, 61, 148),Color.fromARGB(255, 26, 99, 209)])),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10, bottom: 2),
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            margin: EdgeInsets.all(10),
                            child: TextField(
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.white38, fontSize: 18),
                                hintText: "Discover people",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            )
                            ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10),
                          child: Material(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            color: Colors.black54,
                            child: InkWell(
                              child: Container(
                                width: 40,
                                height: 40,
                                child: Icon(Icons.filter_alt_rounded, color: Colors.white),
                              ),
                            )
                          ),
                        )
                      ])))])),
        Expanded(
          child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
                height: 150,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: listEvents.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 1);
                  },
                  itemBuilder: (context, index) {
                    return listEvents[index];},
                ),
              ),
          Container(
            margin: EdgeInsets.all(10),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index){

                  return CustomPost(height: width, width: width,
                    nameUser: posts[index][0],
                    imageUser: posts[index][7],
                    image: posts[index][1],
                    number: posts[index][2],
                    location: posts[index][3],
                    color: posts[index][4],
                    likes: posts[index][5],
                    comments: posts[index][6]
                   );
                }, 
                separatorBuilder: (context, index){
                  return SizedBox(height: 40);
                }, 
                itemCount: posts.length)),

            Container(
                alignment: Alignment.center,
                height: 100,
                child: Text("You reached the end", style: TextStyle(color: Colors.black26, fontSize: 10)),
              )
          ],
        ) 
        )
      ],
    )
    );
  }
}