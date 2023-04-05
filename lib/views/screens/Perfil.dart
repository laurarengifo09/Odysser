import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odisserr/views/screens/page_camera.dart';
import 'package:odisserr/views/screens/page_maps.dart';

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageMaps()));
              },
            ),
            IconButton(
              icon: Icon(Icons.camera_alt_rounded, color: Colors.white),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageCamera()));
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
                Text("200000")
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
                              image: DecorationImage(image: AssetImage('assets/images/post(1).jpg'), fit: BoxFit.cover)),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              padding:
                                  EdgeInsets.only(top: 35, bottom: 5, left: 1),
                              child: Text(
                                "Daniela Rengifo",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width *0.43,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 1)))),
                          Container(
                              padding: EdgeInsets.only(top: 7, left: 12),
                              child: Text(
                                "Level 3: Junior \nScout",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black45),
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
              color: Color.fromARGB(255, 14, 61, 148),
              fontSize: 30,
              fontWeight: FontWeight.bold,
          ))),
          Padding(padding: EdgeInsets.all(10),child:                           
          Container(
              width: 100,
              decoration: BoxDecoration(
                border: Border(
                      bottom: BorderSide(
                          color: Colors.black.withOpacity(0.1),
                          width: 1,
          ))))),
          Container(
              
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 9, 38, 92),
                    boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 14, 61, 148).withOpacity(0.4),
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
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color.fromARGB(255, 14, 61, 148),Color.fromARGB(255, 26, 99, 209)]), 
                        borderRadius: BorderRadius.circular(7)),
                      child: DataTable(
                        columnSpacing: 20,
                        sortColumnIndex: 2,
                        sortAscending: false,
                        headingTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                        dataTextStyle: TextStyle(color: Colors.black87),
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
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(200),
                                            image: DecorationImage(image: AssetImage('assets/images/post(5).jpg'), fit: BoxFit.cover)),
                                      ),
                                      SizedBox(width: 10),
                                      Text("@jdepap2"),
                                    ],
                                  ),
                                ),
                                DataCell(Text("10")),
                                DataCell(Text("Colombia")),
                                // DataCell(Image.asset('assets/images/user.png'))
                              ],
                              
                              
                              color: MaterialStateColor.resolveWith(
                                  (states) => Colors.amber[200])),
                          DataRow(
                            cells: [
                              DataCell(
                                Row(
                                  children: [
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(200),
                                            image: DecorationImage(image: AssetImage('assets/images/post(3).jpg'), fit: BoxFit.cover)),
                                      ),
                                    SizedBox(width: 10),
                                    Text("@niko.kpolo"),
                                  ],
                                ),
                              ),
                              DataCell(Text("5")),
                              DataCell(Text("Spain")),
                              
                            ],
                            color: MaterialStateColor.resolveWith(
                                  (states) => Colors.grey[300])
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Row(
                                  children: [
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(200),
                                            image: DecorationImage(image: AssetImage('assets/images/post(1).jpg'), fit: BoxFit.cover)),
                                      ),
                                    SizedBox(width: 10),
                                    Text("@s_rengifo.97"),
                                  ],
                                ),
                              ),
                              DataCell(Text("3")),
                              DataCell(Text("England")),
                              
                            ],
                            color: MaterialStateColor.resolveWith(
                                  (states) => Colors.deepOrange[200])
                          )
                          ,DataRow(
                            cells: [
                              DataCell(
                                Row(
                                  children: [
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(200),
                                            image: DecorationImage(image: AssetImage('assets/images/post(2).jpg'), fit: BoxFit.cover)),
                                      ),
                                    SizedBox(width: 10),
                                    Text("@rodrigorafa_mora"),
                                  ],
                                ),
                              ),
                              DataCell(Text("2")),
                              DataCell(Text("Colombia")),
                              
                            ],
                            color: MaterialStateColor.resolveWith(
                                  (states) => Colors.white)
                          )
                        ,DataRow(
                            cells: [
                              DataCell(
                                Row(
                                  children: [
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(200),
                                            image: DecorationImage(image: AssetImage('assets/images/post(4).jpg'), fit: BoxFit.cover)),
                                      ),
                                    SizedBox(width: 10),
                                    Text("@nicol_paz09"),
                                  ],
                                ),
                              ),
                              DataCell(Text("1")),
                              DataCell(Text("South Korea")),
                              
                            ],
                            color: MaterialStateColor.resolveWith(
                                  (states) => Colors.white)
                          )
                        ,DataRow(
                            cells: [
                              DataCell(
                                Row(
                                  children: [
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(200),
                                            image: DecorationImage(image: AssetImage('assets/images/post(3).jpg'), fit: BoxFit.cover)),
                                      ),
                                    SizedBox(width: 10),
                                    Text("@01nanii.xd"),
                                  ],
                                ),
                              ),
                              DataCell(Text("1")),
                              DataCell(Text("Hungary")),
                              
                            ],
                            color: MaterialStateColor.resolveWith(
                                  (states) => Colors.white)
                          )
                        ,DataRow(
                            cells: [
                              DataCell(
                                Row(
                                  children: [
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(200),
                                            image: DecorationImage(image: AssetImage('assets/images/user.png'), fit: BoxFit.cover)),
                                      ),
                                    SizedBox(width: 10),
                                    Text("@whis_siud"),
                                  ],
                                ),
                              ),
                              DataCell(Text("1")),
                              DataCell(Text("Russia")),
                              
                            ],
                            color: MaterialStateColor.resolveWith(
                                  (states) => Colors.white)
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
