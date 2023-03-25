import 'package:flutter/material.dart';
import 'package:odisserr/models/core/recipe.dart';
import 'package:odisserr/models/helper/recipe_helper.dart';
import 'package:odisserr/views/screens/delicious_today_page.dart';
import 'package:odisserr/views/screens/newly_posted_page.dart';
import 'package:odisserr/views/screens/profile.dart';
import 'package:odisserr/views/screens/profile_page.dart';
import 'package:odisserr/views/screens/search_page.dart';
import 'package:odisserr/views/utils/AppColor.dart';
import 'package:odisserr/views/widgets/custom_app_bar.dart';
import 'package:odisserr/views/widgets/dummy_search_bar.dart';
import 'package:odisserr/views/widgets/featured_recipe_card.dart';
import 'package:odisserr/views/widgets/profile_card.dart';
import 'package:odisserr/views/widgets/publicacion.dart';
import 'package:odisserr/views/widgets/recipe_tile.dart';
import 'package:odisserr/views/widgets/recommendation_recipe_card.dart';

import 'home_page.dart';

class Profile extends StatelessWidget {
  final List list = [1,2,3,4,5];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Perfil',
            style: TextStyle(fontFamily: 'inter', fontWeight: FontWeight.w700)),
        showProfilePhoto: false,
        profilePhoto: AssetImage('assets/images/user.png'),
        profilePhotoOnPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()));
        },
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          // Section 1 - Featured Recipe - Wrapper
          Container(
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 14, 61, 148),Color.fromARGB(255, 26, 99, 209)])),
                ),
                // Section 1 - Content
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Text("Mis Datos", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: ProfileCard()
                    ),
                  ],
                )
              ],
            ),
          ),

          // Section 2 - Recommendation Recipe
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 5),
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Mis Publicaciones", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                Container(
                  child: GridView.count(
                            shrinkWrap: true,                 
                            crossAxisCount: 2,
                            children: List.generate(list.length, (index) {
                              return Publicacion();
                            }),
                    ),
                ),
              ]
              ),
          )
        ],
      ),
    );
  }
}
