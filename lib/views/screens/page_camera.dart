import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:odisserr/views/screens/page_recognition.dart';
import 'package:odisserr/views/screens/page_switcher.dart';
import 'package:permission_handler/permission_handler.dart';

class PageCamera extends StatefulWidget{
  
  PageCameraState createState()=> PageCameraState();
}

class PageCameraState extends State<PageCamera>{
  List<CameraDescription> _cameras;
  CameraController controller;

  @override
  void initState() {
    super.initState();
    handleCamera();
  }

  handleCamera() async{
    if(await Permission.camera.isGranted){
        _cameras = await availableCameras();
        if(_cameras == null)
          return;
        controller = CameraController(_cameras[0], ResolutionPreset.max);
        controller.initialize().then((_) => setState(() {}));
        
    }
  }


  @override
  Widget build (BuildContext context){

    handlePicture() async{
    var image = await controller.takePicture();
    File newImg = File(image.path);
    Navigator.push(context,MaterialPageRoute(builder: (context) => 
      PageRecognition(image: newImg)));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            child: controller != null? CameraPreview(controller):Text(""),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color.fromARGB(255, 7, 36, 168), Color.fromARGB(255, 45, 71, 190).withOpacity(0.8)]
                      ),
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: Row(
                    children: [
                      FloatingActionButton(
                        heroTag: "Back",
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PageSwitcher()));
                        },
                        child: Icon(Icons.keyboard_return_rounded),
                        backgroundColor: Color.fromARGB(255, 45, 71, 190),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10,right: 15),
                        child: Text("Odysser",style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
              )
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height *0.05,
            left: MediaQuery.of(context).size.width *0.23,
            child: Stack(
              alignment: Alignment.center,
              children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color.fromARGB(255, 45, 71, 190).withOpacity(0.8),Color.fromARGB(255, 7, 36, 168), Color.fromARGB(255, 45, 71, 190).withOpacity(0.8)]
                      ),
                ),
                child: Row(children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: FittedBox(
                      child: FloatingActionButton(
                        heroTag: "myFlash",
                        onPressed: (){},
                        child: Icon(Icons.flash_on_rounded),
                        backgroundColor: Color.fromARGB(255, 45, 71, 190),
                      ),
                    ),
                  ),
                  SizedBox(width: 100),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: FittedBox(
                      child: FloatingActionButton(
                        heroTag: "myAr",
                        onPressed: (){},
                        child: Icon(Icons.remove_red_eye_rounded),
                        backgroundColor: Color.fromARGB(255, 45, 71, 190),
                      ),
                    ),
                  )
                ]),
              )
              ,Container(
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: FittedBox(
                    child: FloatingActionButton(
                      heroTag: "myCam",
                      onPressed: (){
                        handlePicture();
                      },
                      child: Icon(Icons.camera_alt_rounded),
                      backgroundColor: Color.fromARGB(255, 45, 71, 190),
                    ),
                  ),
                )
              ),
            ],)
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height *0.885,
              left: MediaQuery.of(context).size.width *0.83,
              child: FloatingActionButton(
                onPressed: (){},
                mini: true,
                heroTag: "myHelpCam",
                child: Icon(Icons.help_rounded),
                backgroundColor: Color.fromARGB(255, 45, 71, 190),
              )
            )
        
          ],
      ),
    );
  }
}