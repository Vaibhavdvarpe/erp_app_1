import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:velocity_x/velocity_x.dart';

import '../pages_erp/loginPage2.dart';

class Botttomsheet extends StatefulWidget {
  const Botttomsheet({Key? key}) : super(key: key);

  @override
  State<Botttomsheet> createState() => _BotttomsheetState();
}

class _BotttomsheetState extends State<Botttomsheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Center(
            child: ElevatedButton(
              child: Text('Show Modal Bottom Sheet'),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Container(
                                      height: 70,
                                      width: MediaQuery.of(context).size.width,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text("Get Started",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500)),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    const Color.fromRGBO(
                                                        35, 133, 59, 1))),
                                      ))),
                              HeightBox(14),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Already have an account? ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                  Text("Log in",
                                      style: TextStyle(
                                          color: Color.fromRGBO(35, 133, 59, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16))
                                ],
                              ),
                              HeightBox(16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                      "By Continuing you accept the Terms of Use",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                  HeightBox(14),
                                ],
                              ),
                            ],
                          ),
                        )
                        // ListTile(
                        //   leading: Icon(Icons.share),
                        //   title: Text('Share'),
                        // ),
                        // ListTile(
                        //   leading: Icon(Icons.copy),
                        //   title: Text('Copy Link'),
                        // ),
                        // ListTile(
                        //   leading: Icon(Icons.edit),
                        //   title: Text('Edit'),
                        // ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
