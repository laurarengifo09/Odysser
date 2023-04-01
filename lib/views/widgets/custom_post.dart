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
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.green[500],Colors.green[700]]),
                    borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      width: width,
                      child: Row(
                        children: [
                          Icon(Icons.location_pin, color: Colors.white),
                          Text("Cali, Valle del Cauca", style: TextStyle(color: Colors.white))
                        ]),
                    ),
                    Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.white
                      )),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: GestureDetector(
                                child: _isLiked
                                    ? Icon(
                                        Icons.favorite,
                                        size: 25,
                                        color: Colors.red,
                                      )
                                    : Icon(
                                        Icons.favorite_border,
                                        size: 25,
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
                            Text(_likes.toString()),
                            Spacer(),
                            Container(
                              child: GestureDetector(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add_comment,
                                      size: 25,
                                    ),
                                    Text('$_comments'), // Mostrar el número de comentarios
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
