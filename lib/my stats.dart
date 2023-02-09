import 'package:flutter/material.dart';
import 'package:realstate/main.dart';

import 'account page/account page.dart';

class Mystats extends StatelessWidget {
  const Mystats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Stocks",
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
    // body: Center(
    //    child: Column(
    //      mainAxisAlignment: MainAxisAlignment.center,
    //      children: [
    //        ElevatedButton(
    //          onPressed: (){
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(builder:
    //     (context) => Home(
    //   c:
    // ))
    //          },
    //          child: Text("Home"),
    //        ),
    //
    //      ],
    //
    //
    //    ),
    //  ),
  }
}
