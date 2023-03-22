import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odisserr/views/screens/Perfil.dart';
import 'package:odisserr/views/screens/auth/welcome_page.dart';
import 'package:odisserr/views/screens/profile.dart';

import 'package:flutter/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(MyApp());
  });
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    getUsers();
    super.initState();
  }

  void getUsers() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("users");

    QuerySnapshot users = await collectionReference.get();
    if (users.docs.length != 0) {
      for (var doc in users.docs) {
        print(doc.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Open Sans',
          scaffoldBackgroundColor: Colors.white,
        ),
        home: Perfil());
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  @override
  MyAppState createdState() => MyAppState();
}
