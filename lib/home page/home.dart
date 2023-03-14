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
  bool show = false;
  Stream<QuerySnapshot>? Detabase =
      FirebaseFirestore.instance.collection('Detabase').snapshots();
  Stream<QuerySnapshot> filterDatabase(int minPrice, int maxPrice) {
    return FirebaseFirestore.instance
        .collection('Detabase')
        .where('expectedrent', isGreaterThanOrEqualTo: minPrice)
        .where('expectedrent', isLessThanOrEqualTo: maxPrice)
        .snapshots();
  }

  Stream<QuerySnapshot> increment() {
    if (show == false) {
      return FirebaseFirestore.instance.collection('Detabase').snapshots();
    } else {
      return filterDatabase(100, 800);
    }
  }

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
                  height: 200,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: increment(),
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
                      setState(() {
                        show = !show;
                        Detabase = filterDatabase(100, 800);
                      });
                    },
                    child: Text("dsddsfds"))
              ],
            ),
          ),
        ));
  }
}
