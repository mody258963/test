import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realstate/app%20settings/text%20sittings.dart';
import 'account page/account page.dart';
import 'account page/account page.dart';
import 'app settings/textsetting.dart';

class notifcation extends StatelessWidget {
  const notifcation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(117, 53, 52, 52),
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18, bottom: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
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
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                child: Image.network(
                                  "https://www.shutterstock.com/shutterstock/photos/2070995981/display_1500/stock-vector-cyber-or-web-security-digital-data-protection-and-database-safety-bugs-correction-pentesting-and-2070995981.jpg",
                                  height:
                                      MediaQuery.of(context).size.height * 0.20,
                                  width:
                                      MediaQuery.of(context).size.width * 0.90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Positioned(
                                top: MediaQuery.of(context).size.height * 0.24,
                                left:
                                    MediaQuery.of(context).size.height * 0.165,
                                child: FittedBox(
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: DummyText2(
                                        icon1: Icon(Icons.storefront, size: 20),
                                        text1: ' Masr El-G',
                                        text: ' ',
                                      )),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.grey)),
                                  child: const DummyText2(
                                    icon1: Icon(Icons.storefront, size: 20),
                                    text1: '  Store',
                                    text: ' ',
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.83,
                          child: DummyText(
                            text:
                                "Store in craft zone 100m^2 dfsdfdsf sdvgfsdf dsfsdf dsfdf ",
                            size: 22,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
