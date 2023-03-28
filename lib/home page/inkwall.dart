import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../app settings/text sittings.dart';
import '../app settings/textsetting.dart';
import 'filter_model.dart';
import 'home.dart';

class ThePoster extends StatelessWidget {
  ThePoster({super.key});

  // final String? location;
  // final String? type;
  // final String? detals;
  // final List<dynamic>? image;

  bool show = false;

  Stream<QuerySnapshot>? increment() {
    if (show == false) {
      return FirebaseFirestore.instance.collection('Detabase').snapshots();
    } else {
      return c.Detabase;
    }
  }

  final Filteration c = Get.put(Filteration());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: increment(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: snapshot.data!.docs.map(
            (DocumentSnapshot document) {
              Map<String, dynamic>? data =
                  document.data() as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.white)],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/realshare-d1c01.appspot.com/o/pictures%2F1677929998305866.jpg?alt=media&token=79456be5-5f94-40ae-8180-f7542d04e297',
                              height: MediaQuery.of(context).size.height * 0.20,
                              width: MediaQuery.of(context).size.width * 0.90,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Container(
                                constraints: BoxConstraints(
                                  maxWidth: double.infinity,
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.grey)),
                                child: DummyText2(
                                  icon1: Icon(Icons.storefront, size: 20),
                                  text1: ' g',
                                  text: ' ',
                                )),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width: MediaQuery.of(context).size.width * 0.25,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.grey)),
                                child: DummyText2(
                                  icon1: Icon(Icons.storefront, size: 20),
                                  text1: 'g ',
                                  text: ' ',
                                )),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.83,
                        child: DummyText(
                          text: data['detals'].toString(),
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
