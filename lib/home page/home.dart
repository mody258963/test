import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:realstate/home%20page/addingpage.dart';

import '../account page/account page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream<QuerySnapshot>? changer;
  CollectionReference Detabase =
      FirebaseFirestore.instance.collection('Detabase');
  bool sany = false;

  Stream<QuerySnapshot> snapshot = FirebaseFirestore.instance
      .collection('Detabase')
      .orderBy('expectedrent', descending: false)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
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
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: incrment(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }

                      return ListView(
                        children: snapshot.data!.docs.map(
                          (DocumentSnapshot document) {
                            Map<String, dynamic>? data =
                                document.data() as Map<String, dynamic>;
                            return Text(
                                "Full Name: ${data['location']} ${data['detals']}");
                          },
                        ).toList(),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      sany = !sany;
                    },
                    child: Text("dsddsfds"))
              ],
            ),
          ),
        ));
  }

  incrment() {
    if (sany != !sany) {
      return FirebaseFirestore.instance
          .collection('Detabase')
          .orderBy('expectedrent', descending: false)
          .snapshots();
    }
  }
}
