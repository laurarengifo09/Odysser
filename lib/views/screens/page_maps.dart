
import 'dart:async';

import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:location/location.dart';
import 'package:odisserr/views/screens/page_camera.dart';
import 'package:odisserr/views/screens/page_switcher.dart';
import 'package:permission_handler/permission_handler.dart';


class PageMaps extends StatefulWidget {

  PageMapsState createState() => PageMapsState();
}

class PageMapsState extends State<PageMaps>{
  bool _locationEnabled;
  double _zoom;
  String map_style = "";
  LatLng _camPos;
  GoogleMapController _controller;

  @override
  void initState() {
    _locationEnabled = false;
    _zoom = 14.0;
    _camPos = LatLng(0, 0);
    super.initState();
    rootBundle.loadString('assets/text/style_map.txt').then((theme) {
      map_style = theme;
    });
    
    Permission.location.isGranted.then((res){
      setState(() {_locationEnabled = res;});
      if(res){
        getPosition(false);
      }
    });

    setState(() { });
  }
 
  getPosition(anim) async {
    if(_locationEnabled){
      try{
          var location = new Location();
          var myLocation = await location.getLocation();
          if(anim){
            _zoom = 14;
            _controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: LatLng(myLocation.latitude, myLocation.longitude), zoom: _zoom)
            ));
          }else
            _controller.moveCamera(CameraUpdate.newLatLng(LatLng(myLocation.latitude, myLocation.longitude)));
      }catch(err){
        print(err);
      }
      setState(() { });
    }
  }

  handleZoom(out) async {
    _zoom = await _controller.getZoomLevel();
    if(out){
      await _controller.animateCamera(CameraUpdate.zoomOut());
    }else{
      await _controller.animateCamera(CameraUpdate.zoomIn());
    }
    print(_zoom);
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _locationEnabled == true?Stack(
        children: [
          GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          myLocationEnabled: _locationEnabled,
          initialCameraPosition: CameraPosition(
            target: _camPos,
            zoom: _zoom
          ),          
          onMapCreated: (GoogleMapController controller){
            _controller = controller;
            controller.setMapStyle(map_style);
          },),
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
            top: MediaQuery.of(context).size.height * 0.78,
            right: MediaQuery.of(context).size.width * 0.05,
            child: Container(
                  child: FloatingActionButton(
                  mini: true,               
                  heroTag: "MyCam",
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageCamera()));
                  },
                  child: Icon(Icons.camera_alt_rounded, size: 20,),
                  backgroundColor: Color.fromARGB(255, 45, 71, 190),
                ),
              )
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.88,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Container(
                  child: FloatingActionButton(                 
                  heroTag: "MyRoute",
                  onPressed: ()=> getPosition(true),
                  child: Icon(Icons.route, size: 20,),
                  backgroundColor: Color.fromARGB(255, 45, 71, 190),
                ),
              )
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.75,
            right: MediaQuery.of(context).size.width * 0.05,
            child:
                  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                SizedBox(height: 70),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 45, 71, 190),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                      mini: true,
                      heroTag: "ZoomIn",
                      onPressed: () => handleZoom(false),
                      child: Icon(Icons.add),
                      backgroundColor: Color.fromARGB(255, 45, 71, 190),
                      elevation: 2,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 2),
                        width: 15,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.white12,
                                    width: 2)))),
                      FloatingActionButton(
                        mini: true,
                        heroTag: "MyPosition",
                        onPressed: ()=> getPosition(true),
                        child: Icon(Icons.location_searching_rounded),
                        backgroundColor: Color.fromARGB(255, 45, 71, 190),),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 2),
                        width: 15,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.white12,
                                    width: 2)))),
                      FloatingActionButton(
                          mini: true,
                          heroTag: "ZoomOut",
                          onPressed: () => handleZoom(true),
                          child: Icon(Icons.remove),
                          backgroundColor: Color.fromARGB(255, 45, 71, 190),
                          elevation: 10,
                          ),

                  ]),
                ),
              ]),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.width * 0.05,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
              Container(
                padding: EdgeInsets.only(right: 35),
                child:
              Container(
              padding: EdgeInsets.only(top:5, bottom: 2, left: 25, right: 65),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Color.fromARGB(255, 7, 36, 168), Color.fromARGB(255, 45, 71, 190).withOpacity(0.8)]
                  )
              ),
              child: Row(children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  Container(
                    padding: EdgeInsets.only(right: 18, left: 2),
                    child: Text("Level 1",style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
              Container(
                        margin: EdgeInsets.only(top: 2,bottom: 2, right: 8),
                        width: 70,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.white12,
                                    width: 1)))),
              Container(
                          child: Container(
                            padding: EdgeInsets.only(top: 5,bottom: 10,left: 10,right: 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                              Image.asset(
                                'assets/images/coin_detailess.png',
                                height: 15,
                              ),
                              SizedBox(width: 5),
                              Text("200000", style: TextStyle(color: Colors.white),)
                            ]),
                        ))
                ]),
              ),
          ],)
            )
              
              )
              ,Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Color.fromARGB(255, 45, 71, 190), width: 5),
                      image: DecorationImage(image: AssetImage('assets/images/user.png'))),
                ),
            ],)
            )
        ],
      ): Text(''),
    );
  }

}