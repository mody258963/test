import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:realstate/home%20page/addingpage.dart';
import 'package:sqflite/sqflite.dart';

import '../account page/account page.dart';
import '../my stats.dart';
import '../notifcatoin.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CollectionReference Detabase =
      FirebaseFirestore.instance.collection('Detabase');
  Stream<QuerySnapshot> getData() {
    return Detabase.snapshots();
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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Addingpage()));
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
        body: Container(
          padding: EdgeInsets.all(30),
          child: StreamBuilder<QuerySnapshot>(
            stream: getData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final int dataCount = snapshot.data!.docs.length;
              return ListView.builder(
                itemCount: dataCount,
                itemBuilder: (context, index) {
                  final DocumentSnapshot document = snapshot.data!.docs[index];

                  return ListTile(
                    title: Text(document['detals']),
                    subtitle: Text(document['location']),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
