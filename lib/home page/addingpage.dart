import 'dart:ffi';
import 'dart:io' as io;
import 'dart:io';
import 'dart:typed_data';
import 'dart:math';
import 'dart:async';
import 'package:csc_picker/csc_picker.dart';
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
  List<File>? images = [];
  String countryValue = "";
  String? stateValue = "";
  String? cityValue = "";

  Future<void> addUser() {
    return Detabase.add({
      "uuid": FirebaseAuth.instance.currentUser?.uid,
      "location": location.text, // John Doe
      "detals": detals.text, // Stokes and Sons
      "phone number": expectedprice.text,
      "expectedrent": expectedrent.text,
      "image": images

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
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: MediaQuery.of(context).size.height * 0.14,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 0, left: 20, right: 20),
                        child: CSCPicker(
                          onCountryChanged: (value) {
                            setState(() {
                              countryValue = value;
                            });
                          },
                          onStateChanged: (value) {
                            setState(() {
                              stateValue = value;
                            });
                          },
                          onCityChanged: (value) {
                            setState(() {
                              cityValue = value;
                            });
                          },
                          countryFilter: [CscCountry.Egypt],
                          showCities: true,
                          showStates: true,
                          flagState: CountryFlag.DISABLE,
                          dropdownDecoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1)),
                          dropdownHeadingStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          dropdownDialogRadius: 30,
                          searchBarRadius: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
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
                                "Detals , Area , Any Problems , Accese that come with the rooms",
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
                            hintText: "Phone Number",
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
                            hintText: "Rent Per Month",
                            filled: true,
                            fillColor: Colors.white70,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    Container(
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
                                    child: Expanded(
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
                                                  getMultipImage();
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
                              var formdata = formstate.currentState;
                              if (formdata!.validate()) {
                                for (int i = 0; i < images!.length; i++) {
                                  String url = await uploadFile(images![i]);
                                  downloadUrls.add(url);
                                  if (i == images!.length - 1) {
                                    storeEntry(
                                        downloadUrls,
                                        location.text,
                                        detals.text,
                                        expectedprice.text,
                                        expectedrent.text,
                                        countryValue,
                                        stateValue,
                                        cityValue);
                                  }
                                }
                              }
                            },
                            child: DummyText(
                              text: "Add Proberty",
                              size: 20,
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

  List<String> downloadUrls = [];

  final ImagePicker _picker = ImagePicker();

  getMultipImage() async {
    final List<XFile>? pickedImages = await _picker.pickMultiImage();

    if (pickedImages != null) {
      pickedImages.forEach((e) {
        images?.add(File(e.path));
      });

      setState(() {});
    }
  }

  Future<String> uploadFile(File file) async {
    final metaData = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref = storageRef
        .child('pictures/${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask = ref.putFile(file, metaData);

    final taskSnapshot = await uploadTask.whenComplete(() => null);
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }

  storeEntry(List<String> imageUrls, String loc, String det, String pho,
      String ex, String con, String? sta, String? cit) {
    FirebaseFirestore.instance.collection('Detabase').add({
      'image': imageUrls,
      "uuid": FirebaseAuth.instance.currentUser?.uid,
      "location": loc, // John Doe
      "detals": det, // Stokes and Sons
      "phone number": pho,
      "expectedrent": ex,
      "contary": con,
      "State": sta,
      "City": cit
    }).then((value) {});
  }
}
