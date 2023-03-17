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
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
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
                  'PLAY',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.play_arrow,
                  size: 18,
                )
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
                        width: 400,
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
                Text(
                  "GLOBAL RANKING",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
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
                    )
                  ],
                ),
                DataTable(
                  sortColumnIndex: 2,
                  sortAscending: false,
                  columns: [
                    DataColumn(
                      label: Row(
                        children: [
                          Text("UserName",
                              style: TextStyle(fontWeight: FontWeight.bold)),
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
                            (states) => Colors.amber[100])),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
