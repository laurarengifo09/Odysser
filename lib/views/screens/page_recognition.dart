import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:odisserr/views/screens/page_camera.dart';
import 'package:odisserr/views/screens/page_switcher.dart';
import 'package:quickalert/quickalert.dart';

class PageRecognition extends StatefulWidget{
  final File image;

  PageRecognition({@required this.image});
  
  PageRecognitionState createState()=> PageRecognitionState(image: image);
}

class PageRecognitionState extends State<PageRecognition>{
  final File image;


  PageRecognitionState({@required this.image});

  ImageLabelerOptions options;
  ImageLabeler imageLabeler;
  List<ImageLabel> labels = List<ImageLabel>.empty();
  List trueLabels = ['trash', 'garbage','plastic', 'bottle','paper','bag', 'waste', 'tableware','juice'];
  bool isTrash = false;
  int coins = 200000;
  
  @override
  void initState() {
    options = ImageLabelerOptions(confidenceThreshold: 0.7);
    imageLabeler = ImageLabeler(options: options);
    processImage();
    super.initState();
  }

  processImage() async{
    InputImage img = InputImage.fromFile(image);
    labels = await imageLabeler.processImage(img);
    labels.forEach((element) {
      if(trueLabels.contains(element.label.toLowerCase()))
        isTrash = true;
      print('La foto es de: ${element.label}');
      setState(() {});
    });
  }
  @override
  Widget build (BuildContext context){


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
              icon: Icon(Icons.home_rounded, color: Colors.white),
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
                Text('$coins')
              ]),
          ))
        ],
      ),
    
      body: 
        Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: 
              Container(
              height: MediaQuery.of(context).size.height *0.2,
              decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 14, 61, 148),Color.fromARGB(255, 26, 99, 209)])),
            ),
            ),
            ListView(children: [
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              alignment: Alignment.center,
              child: Text("Collect Garbage", style: TextStyle(
                color: Colors.white,
                fontSize: 40
              ),),
            ),
            Positioned(
              child: 
                Container(
                  padding: EdgeInsets.all(20),
                  child: Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5),
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: Offset(2,2)
                        )],
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: FileImage(image), fit: BoxFit.cover)
                      ),
                  )
                )
      
            )
            ,isTrash?Container(
              child: Column(
                children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  child: Text("Thanks for helping the planet. \n\nClaim your coins!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black38, fontSize: 20),)),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: FloatingActionButton(
                  backgroundColor:  Colors.green[800],
                  heroTag: "success",
                  onPressed: (){

                    salir(){
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PageSwitcher(coins: coins+100,)));
                    }

                    QuickAlert.show(context: context, 
                    type:   QuickAlertType.success,
                    text: "Congratulations, you received 100 coins",
                    onCancelBtnTap: () {salir();},
                    onConfirmBtnTap: () {salir();},
                    );
                }, child: Icon(Icons.check))
              ,
                )]),
            ):Container(
              child: Column(
                children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  child: Text("Sorry, we couldn't recognize any garbage related objects\n\nTry again!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black38, fontSize: 20),)),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: FloatingActionButton(
                  backgroundColor: Color.fromARGB(255, 14, 61, 148),
                  heroTag: "failed",
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageCamera()));
                }, child: Icon(Icons.camera_alt_rounded))
                )]),
            ),
          ])],
        ),
      );
  }
}