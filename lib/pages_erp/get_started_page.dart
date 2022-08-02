import 'dart:ui';
import 'package:erp_app/pages_erp/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

// ignore: camel_case_types
class getStarted extends StatelessWidget {
  const getStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));
    return WillPopScope(
      onWillPop: () async => FlutterExitApp.exitApp(),
      child: MaterialApp(
          theme: ThemeData(
              textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
          debugShowCheckedModeBanner: false,
          home: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/get_started_image.png"),
                      fit: BoxFit.cover)),
              child: ClipRRect(
                  child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey.withOpacity(0.1),
                  child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Padding(
                        padding: const EdgeInsets.only(top: 520),
                        child: Container(
                          child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: const Radius.circular(35),
                                  topRight: Radius.circular(35)),
                              child: Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: SizedBox(
                                          height: 55,
                                          width: 315,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                    child: const LoginPage(),
                                                  ),
                                                );
                                              },
                                              child: const Text("Get Started",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          const Color.fromRGBO(
                                                              35,
                                                              133,
                                                              59,
                                                              1))))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text("Already have an account? ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14)),
                                          Text("Log in",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      35, 133, 59, 1),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "By continuing you accept the",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text("Terms of Use",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  decoration:
                                                      TextDecoration.underline))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      )),
                ),
              )))),
    );
  }
}
