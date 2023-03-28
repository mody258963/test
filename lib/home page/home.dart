import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:realstate/home%20page/addingpage.dart';
import 'package:realstate/home%20page/inkwall.dart';

import '../account page/account page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream<QuerySnapshot>? changer;
  double padding = 10;
  // bool show = false;

  // Stream<QuerySnapshot>? Detabase =
  //     FirebaseFirestore.instance.collection('Detabase').snapshots();
  // Stream<QuerySnapshot> filterDatabase(int minPrice, int maxPrice) {
  //   return FirebaseFirestore.instance
  //       .collection('Detabase')
  //       .where('expectedrent', isGreaterThanOrEqualTo: minPrice)
  //       .where('expectedrent', isLessThanOrEqualTo: maxPrice)
  //       .snapshots();
  // }

  // Stream<QuerySnapshot>? increment() {
  //   if (show == false) {
  //     return FirebaseFirestore.instance.collection('Detabase').snapshots();
  //   } else {
  //     return Detabase;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color.fromARGB(117, 53, 52, 52),
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Home",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.add_business_sharp,
                color: Colors.black,
                size: 26,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Addingpage()));
              },
            ),
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AccountPage()));
                },
                icon: const Icon(
                  Icons.account_circle,
                ),
                color: Colors.black,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(right: 21, left: 20),
            child: ThePoster(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              bottom: padding,
                              left: padding,
                              right: padding,
                            ),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.09,
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: OutlinedButton(
                                style: ButtonStyle(),
                                onPressed: () {},
                                child: Text("test"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              bottom: padding,
                              left: padding,
                              right: padding,
                            ),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.09,
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: OutlinedButton(
                                style: ButtonStyle(),
                                onPressed: () {},
                                child: Text("test"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              bottom: padding,
                              left: padding,
                              right: padding,
                            ),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.09,
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: OutlinedButton(
                                style: ButtonStyle(),
                                onPressed: () {},
                                child: Text("test"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              bottom: padding,
                              left: padding,
                              right: padding,
                            ),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.09,
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: OutlinedButton(
                                autofocus: true,
                                style: ButtonStyle(),
                                onPressed: () {},
                                child: Text("test"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ));
  }
}
