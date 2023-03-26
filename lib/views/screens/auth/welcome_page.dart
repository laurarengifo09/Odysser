import 'package:flutter/material.dart';
import 'package:odisserr/views/utils/AppColor.dart';
import 'package:odisserr/views/widgets/modals/login_modal.dart';
import 'package:odisserr/views/widgets/modals/register_modal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage('assets/images/bg.jpg'),
            //         fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 60 / 100,
              decoration: BoxDecoration(gradient: AppColor.linearBlackBottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text('ODISSER',
                            style: TextStyle(
                                fontFamily: 'inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 32,
                                color: Color.fromARGB(255, 15, 44, 11))),
                      ),
                      // Text("Help you when you're odisserr",
                      //     style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Get Started Button
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: ElevatedButton(
                          child: Text('Get Started',
                              style: TextStyle(
                                  color: AppColor.secondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'inter')),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              isScrollControlled: true,
                              builder: (context) {
                                return RegisterModal();
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            primary: AppColor.primarySoft,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Log in Button
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: OutlinedButton(
                          child: Text('Log in',
                              style: TextStyle(
                                  color: AppColor.secondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'inter')),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              isScrollControlled: true,
                              builder: (context) {
                                return LoginModal();
                              },
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side: BorderSide(
                                color: AppColor.secondary.withOpacity(0.5),
                                width: 1),
                            primary: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        margin: EdgeInsets.only(top: 32),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'By joining odisserr, you agree to our ',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                height: 150 / 100),
                            children: [
                              TextSpan(
                                text: 'Terms of service ',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontWeight: FontWeight.w700,
                                    height: 150 / 100),
                              ),
                              TextSpan(
                                text: 'and ',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    height: 150 / 100),
                              ),
                              TextSpan(
                                text: 'Privacy policy.',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontWeight: FontWeight.w700,
                                    height: 150 / 100),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
