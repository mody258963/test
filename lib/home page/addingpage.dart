import 'dart:ffi';
import 'dart:io' as io;
import 'dart:io';
import 'dart:typed_data';
import 'dart:math';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realstate/app%20settings/dumyboutton.dart';
import 'package:realstate/app%20settings/text%20sittings.dart';
import 'package:realstate/home%20page/home.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:realstate/screens.dart';
import '../app settings/textfildsittings.dart';
import 'dart:convert';

class Addingpage extends StatefulWidget {
  const Addingpage({super.key});

  @override
  State<Addingpage> createState() => _AddingpageState();
}

class _AddingpageState extends State<Addingpage> {
  final location = TextEditingController();
  final detals = TextEditingController();
  final expectedprice = TextEditingController();
  final expectedrent = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  CollectionReference Detabase =
      FirebaseFirestore.instance.collection('Detabase');
  var imageUrl = '';
  final ImagePicker imagePicker = ImagePicker();
  PickedFile? file;
  String? uuid = " ";

  Future<void> addUser() {
    return Detabase.add({
      "uuid": FirebaseAuth.instance.currentUser?.uid,
      "location": location.text, // John Doe
      "detals": detals.text, // Stokes and Sons
      "expectedprice": expectedprice.text,
      "expectedrent": expectedrent.text,
      "image": imageUrl,
      // "proparty id" :
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Screens()));
              }),
          backgroundColor: Colors.white,
          title: Text(
            "Add Your Proberty",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: formstate,
          child: Center(
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 60,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          border: Border.all(width: 5, color: Colors.white70),
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: MediaQuery.of(context).size.height * 0.20,
                        //color: Colors.white70,

                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: IconButton(
                            color: Colors.black,
                            onPressed: () {
                              Scaffold.of(context).showBottomSheet<void>(
                                (BuildContext context) {
                                  return Container(
                                    height: 200,
                                    color: Colors.white70,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 180,
                                              top: 20,
                                            ),
                                            child: TextButton.icon(
                                                label: const Text('Camara',
                                                    style: TextStyle(
                                                      fontSize: 35,
                                                      color: Colors.black,
                                                    )),
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                  ImagePicker imagePicker =
                                                      ImagePicker();
                                                  XFile? file =
                                                      await imagePicker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .camera);
                                                  print('${file?.path}');
                                                  if (file == null) return;

                                                  String uniqueFileName =
                                                      DateTime.now()
                                                          .millisecondsSinceEpoch
                                                          .toString();

                                                  Reference referenceDiImages =
                                                      FirebaseStorage.instance
                                                          .ref()
                                                          .child('files');

                                                  Reference
                                                      referenceImagetouplod =
                                                      referenceDiImages.child(
                                                          uniqueFileName);
                                                  var formdata =
                                                      formstate.currentState;

                                                  if (formdata!.validate()) {
                                                    try {
                                                      await referenceImagetouplod
                                                          .putFile(
                                                              File(file.path));

                                                      imageUrl =
                                                          await referenceImagetouplod
                                                              .getDownloadURL();
                                                    } catch (error) {}
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.photo_camera,
                                                  size: 35,
                                                  color: Colors.black,
                                                )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 190,
                                              top: 30,
                                            ),
                                            child: TextButton.icon(
                                                label: const Text('Gallary',
                                                    style: TextStyle(
                                                        fontSize: 35,
                                                        color: Colors.black)),
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                  ImagePicker imagePicker =
                                                      ImagePicker();
                                                  XFile? file =
                                                      await imagePicker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery);
                                                  print('${file?.path}');
                                                  if (file == null) return;

                                                  String uniqueFileName =
                                                      DateTime.now()
                                                          .millisecondsSinceEpoch
                                                          .toString();

                                                  Reference referenceDiImages =
                                                      FirebaseStorage.instance
                                                          .ref()
                                                          .child('files');

                                                  Reference
                                                      referenceImagetouplod =
                                                      referenceDiImages.child(
                                                          uniqueFileName);
                                                  var formdata =
                                                      formstate.currentState;

                                                  if (formdata!.validate()) {
                                                    try {
                                                      await referenceImagetouplod
                                                          .putFile(
                                                              File(file.path));

                                                      imageUrl =
                                                          await referenceImagetouplod
                                                              .getDownloadURL();
                                                    } catch (error) {}
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons
                                                      .photo_size_select_actual_outlined,
                                                  size: 35,
                                                  color: Colors.black,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.add_a_photo_outlined,
                              size: 35,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 100,
                        right: 10,
                        left: 10,
                        bottom: 10,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.length > 100) {
                              return "Max is 100 Charactors";
                            }
                            if (value.length < 4) {
                              return "Please Fill IN";
                            } else {
                              return null;
                            }
                          },
                          controller: location,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                            hintStyle:
                                GoogleFonts.adventPro(color: Colors.black),
                            hintText: "Location",
                            filled: true,
                            fillColor: Colors.white70,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.length > 200) {
                              return "Max is 100 Charactors";
                            }
                            if (value.length < 16) {
                              return "Please Fill IN";
                            } else {
                              return null;
                            }
                          },
                          controller: detals,
                          maxLines: 6,
                          autocorrect: true,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                            hintStyle:
                                GoogleFonts.adventPro(color: Colors.black),
                            hintText:
                                "Detals , Area , Any Problems About The Property",
                            filled: true,
                            fillColor: Colors.white70,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.length > 100) {
                              return "Max is 100 Charactors";
                            }
                            if (value.length < 4) {
                              return "Please Fill IN";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: expectedprice,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                            hintStyle:
                                GoogleFonts.adventPro(color: Colors.black),
                            hintText: "Expected Price",
                            filled: true,
                            fillColor: Colors.white70,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.length > 100) {
                              return "Max is 100 Charactors";
                            }
                            if (value.length < 3) {
                              return "Please Fill IN";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: expectedrent,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                            hintStyle:
                                GoogleFonts.adventPro(color: Colors.black),
                            hintText: "Expected Rent",
                            filled: true,
                            fillColor: Colors.white70,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 40),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: ElevatedButton(
                            onPressed: () async {
                              await addUser();
                            },
                            child: DummyText(
                              text: "Add Proberty",
                              size: 15,
                            ),
                            style: ElevatedButton.styleFrom(
                              alignment: Alignment.center,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.white70,
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
