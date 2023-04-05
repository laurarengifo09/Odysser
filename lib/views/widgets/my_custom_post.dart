import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyCustomPost extends StatefulWidget {
  
  double width;
  double height;
  final color;
  final number;
  final image;
  int likes;
  int comments; //

  MyCustomPost({
    @required this.width, 
    @required this.height,
    @required this.color, 
    @required this.number, 
    @required this.image,
    this.likes = 0,
    this.comments = 0
    });


  @override
  MyCustomPostState createState() => MyCustomPostState(width: width, height: height, color: color, number: number,image: image,likes: likes,comments: comments);
}


class MyCustomPostState extends State<MyCustomPost> {
  double width;
  double height;
  bool _isLiked = false;

  final color;
  final number;
  final image;
  int likes;
  int comments; //

  MyCustomPostState({
    @required this.width, 
    @required this.height,
    @required this.color, 
    @required this.number, 
    @required this.image,
    this.likes = 0,
    this.comments = 0
    });

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
                          Icon(Icons.stars_rounded, color: color),
                          Container(
                            padding: EdgeInsets.only(left: 5,top: 1),
                            child: Text('SDG #$number', style: TextStyle(fontWeight: FontWeight.bold,color: color)),
                          ),
                        ]),
                    ),
                    Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 202, 202, 202),
                        image: DecorationImage(image: AssetImage('assets/images/$image'), fit: BoxFit.cover)
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
                                        color: Color.fromARGB(255, 75, 75, 75)
                                      ),
                                    Container(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text('$likes', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 75, 75, 75))),
                                    ), // Mostrar el número de comentarios
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    if (_isLiked) {
                                      likes--;
                                    } else {
                                      likes++;
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
                                      color: Color.fromARGB(255, 75, 75, 75)
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text('$comments', style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 75, 75, 75)))
                                    ), 
                                  ],
                                ),
                                onTap: () {
                                },
                              ),
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
