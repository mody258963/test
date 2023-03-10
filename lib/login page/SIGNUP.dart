import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:realstate/app%20settings/text%20sittings.dart';
import 'package:realstate/app%20settings/textfildsittings.dart';
import 'package:realstate/home%20page/database.dart';
import 'package:realstate/login%20page/Auth.dart';
import 'package:realstate/screens.dart';

// ignore: must_be_immutable
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailcontroller = TextEditingController();
  final passwodconttroler = TextEditingController();
  final conformpasswodconttroler = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  Future signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      if (passwordconfirmed()) {
        try {
          final credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailcontroller.text,
            password: passwodconttroler.text,
          );
          return credential;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                animType: AnimType.bottomSlide,
                title: 'Week Password',
                body: const Text(
                  "The password is too weak",
                )).show();
          } else if (e.code == 'email-already-in-use') {
            AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                animType: AnimType.bottomSlide,
                title: 'Week Password',
                body: const Text(
                  "The account already exists for that email",
                )).show();
          }
          return null;
        } catch (e) {
          print(e);
        }
      }
    }
  }

  bool passwordconfirmed() {
    if (passwodconttroler.text.trim() == conformpasswodconttroler.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  void openSignScreen() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SignUpPage()));
  }

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwodconttroler.dispose();
    conformpasswodconttroler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        body: SafeArea(
          child: ListView(children: [
            Stack(
              children: [
                Form(
                  key: formstate,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 150,
                        width: 60,
                      ),
                      Text("Create Account",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Montserrat')),
                      SizedBox(
                        height: 60,
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.length > 50) {
                              return "Password is very long";
                            }
                            if (value.length < 8) {
                              return "Password is very short";
                            } else {
                              return null;
                            }
                          },
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                            hintText: "Email",
                            filled: true,
                            fillColor: Colors.white12,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(45),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.length > 20) {
                              return "Password is very long";
                            }
                            if (value.length < 7) {
                              return "Password is very short";
                            } else {
                              return null;
                            }
                          },
                          controller: passwodconttroler,
                          keyboardType: TextInputType.visiblePassword,
                          textAlignVertical: TextAlignVertical.bottom,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            filled: true,
                            fillColor: Colors.white12,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(45),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 40),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.length > 20) {
                              return "Password is very long";
                            }
                            if (value.length < 7) {
                              return "Password is very short";
                            } else {
                              return null;
                            }
                          },
                          controller: conformpasswodconttroler,
                          textAlignVertical: TextAlignVertical.bottom,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: "Conform Password",
                            filled: true,
                            fillColor: Colors.white12,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(45),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (signUp() == null) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const Screens()));
                          }
                        },
                        child: DummyText(
                          text: "Sign Up",
                          size: 9,
                        ),
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.white,
                          maximumSize: const Size(300, 65),
                          minimumSize: const Size(300, 65),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
