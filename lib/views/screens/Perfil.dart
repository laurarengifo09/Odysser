import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 14, 61, 148),Color.fromARGB(255, 26, 99, 209)]))),
        brightness: Brightness.dark,
        elevation: 0,
        centerTitle: true,
        title: Text('ODYSSER',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        leadingWidth: 100,
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.map_sharp, color: Colors.white),
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(Icons.camera_alt_rounded, color: Colors.white),
              onPressed: () {
              },
            ),
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(100)
              ),
              child: Row(
                children: [
                Image.asset(
                  'assets/images/coin_detailess.png',
                  height: 25,
                ),
                SizedBox(width: 5),
                Text("200,000")
              ]),
          ))
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
                              borderRadius: BorderRadius.circular(200),
                              image: DecorationImage(image: AssetImage('assets/images/user.png'))),
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
                                "Name",
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
          Container(
            padding: EdgeInsets.only(left: 15),
            child:
          Text(
            "GLOBAL RANKING",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
          ))),
          Padding(padding: EdgeInsets.all(10),child:                           
          Container(
              padding: EdgeInsets.symmetric(horizontal: 100),
              decoration: BoxDecoration(
                border: Border(
                      bottom: BorderSide(
                          color: Colors.black.withOpacity(0.1),
                          width: 1,
                          ))))),
          Container(
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color.fromARGB(255, 13, 80, 204),Color.fromARGB(255, 0, 145, 48)], 
                    begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                        BoxShadow(
                          color: Color(0xFF094542).withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 7,
                          blurStyle: BlurStyle.normal,
                          offset: Offset(5, 7), // changes position of shadow
                  )
                ],),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white24),
                      child: SizedBox(
                      width: 430,
                      height: 40,
                      child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Colors.white54),
                            hintText: 'Search friends',
                            hintStyle: TextStyle(color: Colors.white54),
                            enabledBorder: InputBorder.none
                            ),
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      )
                    ),
                    Padding(padding: EdgeInsets.all(10),child:                           Container(
                              width: 420,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black.withOpacity(0.1),
                                          width: 1))))),
                    Container(
                      width: 430,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(7)),
                      child: DataTable(
                        sortColumnIndex: 2,
                        sortAscending: false,
                        headingTextStyle: TextStyle(color: Colors.teal[900], fontWeight: FontWeight.bold, fontSize: 16),
                        dataTextStyle: TextStyle(color: Colors.white),
                        columns: [
                      DataColumn(
                            label: Center(child: Text("Name",
                                    
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center),)
                            ),
                      DataColumn(
                            label: Center(child: Text("Level",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center),)
                            ),
                      DataColumn(
                            label: Center(child: Text("Country",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center),)
                            )
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
                                    Text("Laura"),
                                  ],
                                ),
                              ),
                              DataCell(Text("81")),
                              DataCell(Text("Colombia")),
                              
                            ],
                            color: MaterialStateColor.resolveWith(
                                  (states) => Colors.grey[500])
                          ),
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
                            color: MaterialStateColor.resolveWith(
                                  (states) => Colors.deepOrange[700])
                          )
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
