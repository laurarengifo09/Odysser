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
import 'package:odisserr/views/widgets/recipe_tile.dart';
import 'package:odisserr/views/widgets/recommendation_recipe_card.dart';

import 'home_page.dart';

class Profile extends StatelessWidget {
  final List<Recipe> featuredRecipe = RecipeHelper.featuredRecipe;
  final List<Recipe> recommendationRecipe = RecipeHelper.recommendationRecipe;
  final List<Recipe> newlyPostedRecipe = RecipeHelper.newlyPostedRecipe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Perfil',
            style: TextStyle(fontFamily: 'inter', fontWeight: FontWeight.w700)),
        showProfilePhoto: true,
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
            height: 290,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  height: 150,
                  color: Colors.blue,
                ),
                // Section 1 - Content
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      height: 250,
                      alignment: Alignment.center,
                      child: ListView.separated(
                        itemCount: featuredRecipe.length,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 16,
                          );
                        },
                        itemBuilder: (context, index) {
                          return ProfileCard(data: featuredRecipe[index]);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          // Section 2 - Recommendation Recipe
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header

                // Content
              ],
            ),
          ),

          Container(
            height: 200,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 186, 179, 179),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.all(10)),
                // Recipe Photo
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 210,
                          height: 210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 0, 15, 22),
                          ))
                    ],
                  ),
                ),

                SizedBox(width: 20),
                Container(
                  width: 210,
                  height: 210,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(255, 0, 15, 22),
                  ),
                ),

                // Recipe Info
              ],
            ),
          ),
          Container(
            height: 200,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 186, 179, 179),
            ),
            child: Row(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                // Recipe Photo
                Container(
                  width: 210,
                  height: 210,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(255, 0, 15, 22),
                  ),
                  child: Column(
                    children: [
                      Container(
            height: 20,
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(color: Colors.white),
                  child: 
                  Row(children: [
                    Icon(
                      Icons.gps_fixed,
                      size: 14,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 1),
                        child: Text(
                          'ubicacion',
                          style: TextStyle(fontSize: 10),
                        ),
                  ),
                ])),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(color: Colors.white),
                  child: 
                  Row(children: [
                    Icon(
                      Icons.comment,
                      size: 14,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          'comentarios',
                          style: TextStyle(fontSize: 10),
                        ),
                  ),
                ])),
              ],
            ),
            ],)
          ),
          
                    ]),
                ),
                SizedBox(width: 20),
                Container(
                  width: 210,
                  height: 210,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(255, 0, 15, 22),
                  ),
                ),

                // Recipe Info
              ],
            ),
          ),
          // Section 3 - Newly Posted
        ],
      ),
    );
  }
}
