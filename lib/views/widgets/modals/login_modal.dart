import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:odisserr/views/screens/auth/welcome_page.dart';
import 'package:odisserr/views/screens/page_switcher.dart';
import 'package:odisserr/views/screens/profile.dart';
import 'package:odisserr/views/utils/AppColor.dart';
import 'package:odisserr/views/widgets/custom_text_field.dart';
import 'package:odisserr/views/widgets/modals/register_modal.dart';

class LoginModal extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 85 / 100,
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            physics: BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 35 / 100,
                  margin: EdgeInsets.only(bottom: 20),
                  height: 6,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              // header
              Container(
                margin: EdgeInsets.only(bottom: 24),
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'inter'),
                ),
              ),
              // Form
              CustomTextField(
                  // controller: emailController,
                  title: 'Email',
                  hint: 'youremail@email.com'),
              CustomTextField(
                  controller: passwordController,
                  title: 'Password',
                  hint: '**********',
                  obsecureText: true,
                  margin: EdgeInsets.only(top: 16)),
              // Log in Button
              Container(
                margin: EdgeInsets.only(top: 32, bottom: 6),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      var users =
                          FirebaseFirestore.instance.collection('users');
                      var snapshot = await users
                          .where('email',
                              isEqualTo: emailController.text.toLowerCase())
                          .where('password', isEqualTo: passwordController.text)
                          .get();
                      if (snapshot.docs.isNotEmpty) {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Profile()));
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => PageSwitcher()));
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Usuario no registrado"),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text("Okay"),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WelcomePage()));
                                    },
                                    child: Text('Register'))
                              ],
                            );
                          },
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == "user not found") {
                        print('usuario no creado');
                      } else if (e.code == 'wrong password') {
                        print('wrong password');
                      }
                    }
                  },
                  child: Text('Login',
                      style: TextStyle(
                          color: AppColor.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter')),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: AppColor.primarySoft,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Forgot your password? ',
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'inter',
                          ),
                          text: 'Reset')
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
