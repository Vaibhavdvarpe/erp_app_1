import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPass extends StatelessWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
        debugShowCheckedModeBanner: false,
        home: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white24,
                  elevation: 0,
                  leadingWidth: 0,
                  leading: const Icon(
                    Icons.arrow_back_ios,
                    color: Color.fromRGBO(35, 133, 59, 1),
                  ),
                  title: const Text(
                    "Back",
                    style: TextStyle(color: Color.fromRGBO(35, 133, 59, 1)),
                  ),
                ),
                body: SingleChildScrollView(
                    child: Column(children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 22,left: 10,right: 264),
                  //   child: Row(
                  //     children: [
                  //       SvgPicture.asset("assets/svg/backbutton_svg.svg",height: 42,width: 85,)],
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 63, right: 47, top: 53, bottom: 43),
                        child: Container(
                          width: 250,
                          height: 128,
                          child: SvgPicture.asset("assets/svg/forgot_pass.svg"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Forgot Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 24),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 13,
                      bottom: 17,
                    ),
                    child: SvgPicture.asset(
                      "assets/svg/green_dots.svg",
                      width: 50,
                      height: 6,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Your new password must be different",
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("from previous used passwords.",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 17, left: 28, right: 26, bottom: 5),
                    child: Container(
                      height: 50,
                      width: 321,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 17),
                            child: SvgPicture.asset(
                              "assets/svg/password_symbol_text.svg",
                              height: 21,
                              width: 21,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 17, right: 17),
                            child: SvgPicture.asset(
                              "assets/svg/vertical_line.svg",
                              height: 18,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 7),
                                child: Container(
                                    height: 21,
                                    width: 170,
                                    child: const Padding(
                                      padding: EdgeInsets.only(bottom: 1),
                                      child: TextField(
                                        obscureText: true,
                                        obscuringCharacter: "*",
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(bottom: 15),
                                          border: InputBorder.none,
                                          hintText: "New Password",
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                                height: 18,
                                child: const Text(
                                  "Show",
                                  style: TextStyle(
                                      color: Color.fromRGBO(35, 133, 59, 1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 9, right: 120, bottom: 17),
                    child: const Text(
                      "Must be at least 8 Characters.",
                      style: TextStyle(
                          color: Color.fromARGB(255, 126, 117, 117),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 5, left: 28, right: 26),
                    child: Container(
                      height: 50,
                      width: 321,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 17),
                            child: SvgPicture.asset(
                              "assets/svg/password_symbol_text.svg",
                              height: 21,
                              width: 21,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 17, right: 17),
                            child: SvgPicture.asset(
                              "assets/svg/vertical_line.svg",
                              height: 18,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 7),
                                child: Container(
                                    height: 21,
                                    width: 150,
                                    child: const Padding(
                                      padding: EdgeInsets.only(bottom: 1),
                                      child: TextField(
                                        obscureText: true,
                                        obscuringCharacter: "*",
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(bottom: 14),
                                          border: InputBorder.none,
                                          hintText: "Confirm Password",
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 28),
                            child: Container(
                                height: 18,
                                child: const Text(
                                  "Show",
                                  style: TextStyle(
                                      color: Color.fromRGBO(35, 133, 59, 1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 120, bottom: 17),
                    child: const Text("Both Passwords must match.",
                        style: TextStyle(
                            color: Color.fromARGB(255, 126, 117, 117),
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26, right: 26),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                                height: 50,
                                width: 306,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text("Reset Password",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromRGBO(
                                                  35, 133, 59, 1))),
                                )))
                      ],
                    ),
                  ),
                ])))));
  }
}
