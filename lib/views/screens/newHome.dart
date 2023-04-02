import 'dart:math';

import 'package:flutter/material.dart';
import 'package:odisserr/views/widgets/custom_event.dart';
import 'package:odisserr/views/widgets/custom_post.dart';


class NewHome extends StatefulWidget{
  @override
  NewHomeState createState() => NewHomeState();
}


class NewHomeState extends State<NewHome> {
  TextEditingController searchInputController = TextEditingController();
  List<Widget> listEvents = [
    CustomEvent(title: 'Event', icon: Icons.event_note, redirect: Text("a"), listColors: [Colors.red, Colors.orange]),
    CustomEvent(title: 'News', icon: Icons.newspaper, redirect: Text("a"), listColors: [Colors.green, Colors.lightBlue[600]]),
    CustomEvent(title: 'Trends', icon: Icons.trending_up_sharp, redirect: Text("a"), listColors: [Colors.purple, Colors.pink]),
    CustomEvent(title: 'Challenges', icon: Icons.track_changes, redirect: Text("a"), listColors: [Colors.amber, Color.fromARGB(255, 125, 143, 24)]),
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
              },
            ),
            IconButton(
              icon: Icon(Icons.camera_alt_rounded, color: Colors.white),
              onPressed: () {
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
                Text("200,000")
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
                            padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            margin: EdgeInsets.all(10),
                            child: TextField(
                              
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              style: TextStyle(color: Colors.white, fontSize: 20),
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
                  return CustomPost(height: width, width: width);
                }, 
                separatorBuilder: (context, index){
                  return SizedBox(height: 40);
                }, 
                itemCount: 10)),

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