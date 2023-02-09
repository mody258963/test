import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:realstate/account%20page/bank%20accounts.dart';
import 'package:realstate/account%20page/personal%20details.dart';
import 'package:realstate/login%20page/login.dart';
import '../app settings/dumyboutton.dart';
import '../app settings/text sittings.dart';

class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: const Text(
            "Account",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 32),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: 600,
                width: 600,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.all(3)),
                      CircleAvatar(
                        radius: 40.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      const SizedBox(
                        width: 0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: const [
                            DummyText(text: "Mohamed Ashmawy"),
                            Text('@user name')
                          ],
                        ),
                      ),
                      const Xbutton(
                        text: "  Personal Details",
                        icons: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        page: PersonalDetails(),
                      ),
                      const SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      const Xbutton(
                        text: "  Bank Account",
                        icons: Icon(
                          Icons.credit_card_outlined,
                          color: Colors.black,
                        ),
                        page: BankAccounts(),
                      ),
                      const SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      const Xbutton(
                        text: "  Change Passcode",
                        icons: Icon(
                          Icons.phonelink_lock,
                          color: Colors.black,
                        ),
                        page: BankAccounts(),
                      ),
                      const SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                        },
                        label: const Text(
                          "  Logout",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w800,
                              fontSize: 22),
                        ),
                        icon: Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.white,
                          maximumSize: const Size(600, 65),
                          minimumSize: const Size(600, 65),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
