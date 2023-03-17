import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odisserr/views/utils/AppColor.dart';
import 'package:odisserr/views/widgets/user_info_tile.dart';
import 'package:flutter_icons/flutter_icons.dart/';

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
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'PLAY',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
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
          // Section 1 - Profile Picture Wrapper
          Container(
            alignment: Alignment.bottomLeft,
            color: Color.fromARGB(164, 255, 255, 255),
            padding: EdgeInsets.symmetric(vertical: 24),
            child: GestureDetector(
              onTap: () {
                print('Code to open file manager');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        width: 130,
                        height: 130,
                        margin: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey,

                          // Profile Picture
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          // Section 2 - User Info Wrapper
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(255, 230, 230, 230),
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Filter by Country',
                      prefixIcon: Icon(FlutterIcons.filter_list_mdi),
                      hintStyle: TextStyle(fontSize: 9),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 5)),
                ),
                Text(
                  "GLOBAL RANKING",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DataTable(
                  sortColumnIndex: 2,
                  sortAscending: false,
                  columns: [
                    DataColumn(
                        label: Text("UserName",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ))),
                    DataColumn(
                      label: Text(
                        "Level",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Country",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                  rows: [
                    DataRow(selected: true, cells: [
                      DataCell(Text("Jose Escobar")),
                      DataCell(Text("100")),
                      DataCell(Text("Colombia"))
                    ]),
                    DataRow(cells: [
                      DataCell(Text("Danielaaa")),
                      DataCell(Text("80")),
                      DataCell(Text("Colombia"))
                    ])
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
