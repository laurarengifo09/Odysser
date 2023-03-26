import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odisserr/models/core/recipe.dart';
import 'package:odisserr/views/screens/recipe_detail_page.dart';

class Publicacion extends StatefulWidget {
  @override
  _PublicacionState createState() => _PublicacionState();
}

class _PublicacionState extends State<Publicacion> {
  bool _isLiked = false;
  int _likes = 0;
  int _comments = 0; // Agregar el estado para el número de comentarios

  TextEditingController _commentController = TextEditingController();

  void mostrarCuadroDeComentarios() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Agregar comentario'),
          content: TextField(
            controller: _commentController,
            decoration: InputDecoration(
              hintText: 'Escribe tu comentario aquí',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Agregar'),
              onPressed: () {
                setState(() {
                  if (_commentController.text.isNotEmpty) {
                    _comments++;
                  }
                  _commentController.clear();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 214, 214, 214)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 10,
            color: Colors.black12,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.all(15),
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(5))),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 40),
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
                Spacer(),
                Text('$_likes Likes'),
                Spacer(),
                Container(
                  child: Icon(
                    Icons.location_on_rounded,
                    size: 25,
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 40),
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
                      mostrarCuadroDeComentarios();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
