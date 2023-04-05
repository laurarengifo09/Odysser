import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomPost extends StatefulWidget {
  double width;
  double height;

  final nameUser;
  final imageUser;
  final image;
  final number;
  final location;
  final color;
  int likes;
  int comments;

  CustomPost({
    @required this.width, 
    @required this.height,
    @required this.nameUser,
    @required this.imageUser,
    @required this.image,
    @required this.number,
    @required this.location,
    @required this.color,
    this.comments = 0,
    this.likes = 0
    });

  @override
  CustomPostState createState() => CustomPostState(width: width, height: height, nameUser: nameUser, imageUser: imageUser, color: color, image: image, location: location, number: number, comments: comments, likes: likes);
}


class CustomPostState extends State<CustomPost> {
  double width;
  double height;
  bool _isLiked = false;

  final nameUser;
  final imageUser;
  final image;
  final number;
  final location;
  final color;
  int likes;
  int comments;

  CustomPostState({
    @required this.width, 
    @required this.height,
    @required this.nameUser,
    @required this.imageUser,
    @required this.image,
    @required this.number,
    @required this.location,
    @required this.color,
    this.comments = 0,
    this.likes = 0
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
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              image: DecorationImage(image: AssetImage('assets/images/$imageUser'), fit: BoxFit.cover))
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Text('$nameUser', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 75, 75, 75))),
                          ),
                          Spacer(),
                          Container(
                            child: Text('SDG #$number', style: TextStyle(fontWeight: FontWeight.bold,color: color)),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5,top: 1, right: 10),
                            child: Icon(Icons.stars_rounded, color: color),
                          ),
                        ]),
                    ),
                    Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 202, 202, 202),
                        image: DecorationImage(image: AssetImage('assets/images/$image'), fit: BoxFit.cover)) 
                      ),
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
                                      child: Text('$comments', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 75, 75, 75)))
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
                                  Icon(Icons.location_pin, 
                                      color: Color.fromARGB(255, 75, 75, 75)),
                                  Container(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("$location", style: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),)
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
