import 'dart:ui';
import 'package:erp_app/widgets/bottomsheet.dart';
import 'package:erp_app/pages_erp/loginPage2.dart';
import 'package:erp_app/widgets/loginpage.dart';
import 'package:erp_app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: camel_case_types
class getStarted extends StatelessWidget {
  const getStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return WillPopScope(
      onWillPop: () async => FlutterExitApp.exitApp(),
      child: Scaffold(
        // key: scaffoldKey,
        // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/get_started_image.png"),
                          fit: BoxFit.cover)),
                  child: BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                    child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                )),
            Align(
              alignment: AlignmentDirectional(0, 1),
              child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                      // color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        HeightBox(10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: const LoginPage2(),
                                      ),
                                    );
                                  },
                                  child: const Text("Get Started",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              C.appGreen)))),
                        ),
                        HeightBox(16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16)),
                            WidthBox(1),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: const LoginPage2(),
                                  ),
                                );
                              },
                              child: Text("Log in",
                                  style: TextStyle(
                                      color: C.appGreen,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                            )
                          ],
                        ),
                        HeightBox(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "By continuing you accept the",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              child: Text("Terms of Use",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline)),
                            )
                          ],
                        ),
                        HeightBox(15)
                      ],
                    ),
                  )

                  //  Stack(
                  //   children: [
                  //     Align(
                  //         alignment: AlignmentDirectional(0, -0.75),
                  //         child: ElevatedButton(
                  //             onPressed: () {}, child: Text("data"))),
                  //     Align(
                  //       alignment: AlignmentDirectional(0, 0),
                  //       child: Text(
                  //         'Already have an account? Log in.',
                  //         // style: FlutterFlowTheme.of(context).bodyText1,
                  //       ),
                  //     ),
                  //     Align(
                  //       alignment: AlignmentDirectional(0, 0.4),
                  //       child: Text(
                  //         'By Continuing you accept the Term of Use',
                  //         // style: FlutterFlowTheme.of(context).bodyText1,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
