

import 'dart:convert';
import 'dart:io';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:odisserr/views/screens/page_switcher.dart';
import 'package:flutter/services.dart' show rootBundle;

class PageHelp extends StatefulWidget{
  PageHelpState createState() => PageHelpState();
}

class PageHelpState extends State<PageHelp>{

  Map<String, dynamic> listOds;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJson();
    });
  }

  loadJson() async {
    String data = await rootBundle.loadString('assets/text/help.json');
    var jsonResult = jsonDecode(data);
    listOds = jsonResult;
    setState(() {});
  }

  @override
  Widget build (BuildContext context){
    if(listOds == null){
      return Text("");
    }
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
        leading: IconButton(
              icon: Icon(Icons.keyboard_return_rounded, color: Colors.white),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageSwitcher()));
              },
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
    
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Text("¿WHAT ARE THE SUSTAINABLE DEVELOPMENT GOALS?",
                  style: TextStyle(fontSize: 40, color: Color.fromARGB(255, 3, 7, 71), fontWeight: FontWeight.bold),),
        ),
        ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context,index){
          return Container();
        }, 
        itemBuilder: (context,index){
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(listOds['ods'][index]['title'],style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 14, 61, 148)),),
              ),
              ExpandText(
                listOds['ods'][index]['content'],
                textAlign: TextAlign.justify,
              )
            ],)
          );
        }, 
        itemCount: listOds['ods'].length)
    
      ],));
  }
}