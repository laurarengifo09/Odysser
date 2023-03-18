import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odisserr/views/utils/AppColor.dart';
import 'package:odisserr/views/widgets/user_info_tile.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: AppColor.primary,
        elevation: 0,
        centerTitle: true,
        title: Text('ODYSSER',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 16)),
        leading: IconButton(
          icon: Icon(Icons.map_sharp, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'CAMARA',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 5),
              ],
            ),
            style: TextButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 24),
            child: GestureDetector(
              onTap: () {
                print('Code to open file manager');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10), // Aquí agregamos el padding
                        child: Container(
                          width: 170,
                          height: 170,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(200)),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              padding:
                                  EdgeInsets.only(top: 35, bottom: 2, left: 5),
                              child: Text(
                                "Nombre",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              )),
                          Container(
                              width: 300,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 1)))),
                          Container(
                              padding: EdgeInsets.only(top: 7, left: 12),
                              child: Text(
                                "Level 1: Recolector Junior",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black45),
                              ))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Section 2 - User Info Wrapper
          Container(
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Text(
                      "GLOBAL RANKING",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      height: 30,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search friends',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(width: 1),
                          ),
                        ),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      child: DataTable(
                        sortColumnIndex: 2,
                        sortAscending: false,
                        columns: [
                          DataColumn(
                            label: Row(
                              children: [
                                Text("UserName",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(width: 3),
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Level",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Row(
                              children: [
                                Text(
                                  "Country",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 1),
                                DropdownButton(
                                  underline: Container(),
                                  items: [
                                    DropdownMenuItem(
                                      child: Text("Colombia"),
                                      value: "Colombia",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("USA"),
                                      value: "USA",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Spain"),
                                      value: "Spain",
                                    ),
                                  ],
                                  hint: Text(""),
                                ),
                              ],
                            ),
                          ),
                        ],
                        rows: [
                          DataRow(
                              selected: true,
                              cells: [
                                DataCell(
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/user.png',
                                        height: 25,
                                      ),
                                      SizedBox(width: 10),
                                      Text("Jose Escobar"),
                                    ],
                                  ),
                                ),
                                DataCell(Text("100")),
                                DataCell(Text("Colombia")),
                                // DataCell(Image.asset('assets/images/user.png'))
                              ],
                              color: MaterialStateColor.resolveWith(
                                  (states) => Colors.amber)),
                          DataRow(
                            cells: [
                              DataCell(
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/user.png',
                                      height: 25,
                                    ),
                                    SizedBox(width: 10),
                                    Text("Danielaaa"),
                                  ],
                                ),
                              ),
                              DataCell(Text("80")),
                              DataCell(Text("Colombia")),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
