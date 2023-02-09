import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'account page/account page.dart';
import 'account page/account page.dart';

class notifcation extends StatelessWidget {
  const notifcation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Notifcation",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 32),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AccountPage()));
              },
              icon: const Icon(Icons.account_circle),
              color: Colors.black,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
