import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odisserr/models/helper/recipe_helper.dart';
import 'package:odisserr/views/screens/Perfil.dart';
import 'package:odisserr/views/screens/auth/welcome_page.dart';
import 'package:odisserr/views/screens/delicious_today_page.dart';
import 'package:odisserr/views/screens/home_page.dart';
import 'package:odisserr/views/screens/newly_posted_page.dart';
import 'package:odisserr/views/screens/page_switcher.dart';
import 'package:odisserr/views/screens/profile.dart';

import 'package:flutter/widgets.dart';
import 'package:odisserr/views/widgets/publicacion.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAOiQGz6URsKueFg76s4hiZdzMe3qRjgus",
      appId: "1:357951992821:android:ad8047efb835e0b090e6bc",
      messagingSenderId: "357951992821",
      projectId: "odysser-e28f1",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyAppSt());
  }
}

class MyAppState extends State<MyAppSt> {
  @override
  void initState() {
    super.initState();
    getUsers();
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
        home: WelcomePage());
  }
}

class MyAppSt extends StatefulWidget {
  MyAppSt() : super();

  @override
  MyAppState createState() => MyAppState();
}
