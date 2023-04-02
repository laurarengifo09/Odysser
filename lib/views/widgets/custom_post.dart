import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomPost extends StatefulWidget {
  double width;
  double height;

  CustomPost({@required this.width, @required this.height});


  @override
  CustomPostState createState() => CustomPostState(width: width, height: height);
}


class CustomPostState extends State<CustomPost> {
  double width;
  double height;
  bool _isLiked = false;
  int _likes = 0;
  int _comments = 0; //

  CustomPostState({@required this.width, @required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Color.fromARGB(20, 0, 0, 0),
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(4,4)
                    )],
                    borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 7),
                      padding: EdgeInsets.only(left: 10),
                      width: width,
                      child: Row(
                        children: [
                          Icon(Icons.stars_rounded, color: Colors.red[800]),
                          Container(
                            padding: EdgeInsets.only(left: 5,top: 1),
                            child: Text('ODS: 1 - Hambre cero', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red[800])),
                          ),
                        ]),
                    ),
                    Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 202, 202, 202)
                      )),
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: GestureDetector(
                                child: Row(
                                  children: [
                                    _isLiked
                                    ? Icon(
                                        Icons.favorite,
                                        size: 25,
                                        color: Colors.red,
                                      )
                                    : Icon(   
                                        Icons.favorite_border,
                                        size: 25,
                                      ),
                                    Container(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text('$_likes', style: TextStyle(fontWeight: FontWeight.bold)),
                                    ), // Mostrar el número de comentarios
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    if (_isLiked) {
                                      _likes--;
                                    } else {
                                      _likes++;
                                    }
                                    _isLiked = !_isLiked;
                                  });
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              child: GestureDetector(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.comment,
                                      size: 25,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text('$_comments', style: TextStyle(fontWeight: FontWeight.bold))
                                    ), 
                                  ],
                                ),
                                onTap: () {
                                },
                              ),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.only(right: 15),
                              child: Row(
                                children: [
                                  Icon(Icons.location_pin),
                                  Container(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Cali, Valle del Cauca")
                                    ),
                                ]),
                            ),
                          ],
                        ),
                      )
                    
                  ]),
                ),
      ],)
    );
  }
}
