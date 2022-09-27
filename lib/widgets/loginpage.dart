import 'package:erp_app/pages_erp/forgot_pass.dart';
import 'package:erp_app/pages_erp/homepage.dart';
import 'package:erp_app/pages_erp/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../bloc/user_auth_bloc/authmodel.dart';
import '../bloc/user_auth_bloc/user_auth_bloc.dart';
import '../bloc/user_verification_bloc/check_user_model.dart';
import '../bloc/user_verification_bloc/user_verfication_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final fieldText1 = TextEditingController();
  final fieldText2 = TextEditingController();
  final fieldText3 = TextEditingController();

  void clearText() {
    fieldText1.clear();
    fieldText2.clear();
    fieldText3.clear();
  }

  String? username = '';
  String? password = '';
  String? clientcode = '';
  String? otp = '';
  String? resultMessage = '';
  String? isOTP = "";
  String? mobileNo = '';
  String? success;
  String? otpStatus = '';

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Container(child: Image.asset("assets/images/erp_login.png")),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                child: Container(
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 30, left: 27),
                        child: Text("Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 24)),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 6, left: 27),
                    child: Text("To Continue ERP App",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14)),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 14, left: 27),
                      child: SvgPicture.asset("assets/svg/green_dots.svg",
                          width: 88, height: 6))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 17),
                child: Container(
                    height: 50,
                    width: 305,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 4),
                          child: SvgPicture.asset(
                            "assets/svg/userimage2.svg",
                            height: 25,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: SvgPicture.asset(
                            "assets/svg/vertical_line.svg",
                            height: 20,
                          ),
                        ),
                        StreamBuilder(
                            stream: checkUserBloc.streamData(),
                            builder: (BuildContext context,
                                AsyncSnapshot<CheckUserModel> snapshot) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 7),
                                    child: Container(
                                        height: 21,
                                        width: 190,
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom: 1),
                                          child: TextField(
                                            controller: fieldText1,
                                            onChanged: (value) {
                                              clientcode = value;
                                            },
                                            decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.only(bottom: 15),
                                                border: InputBorder.none,
                                                hintText: "Client Code"),
                                          ),
                                        )),
                                  ),
                                ],
                              );
                            }),
                        // StreamBuilder(
                        //     stream: checkUserBloc.streamData(),
                        //     builder: (BuildContext context,
                        //         AsyncSnapshot<CheckUserModel> snapshot) {
                        //       return TextField(
                        //         onChanged: (value) {
                        //           clientcode = value;
                        //         },
                        //         obscureText: false,
                        //         decoration: const InputDecoration(
                        //           isDense: true,
                        //           hintText: 'Client Code',
                        //           border: InputBorder.none,
                        //         ),
                        //       );
                        //     }),
                      ],
                    )),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 28, right: 5),
                    child: Container(
                      height: 50,
                      width: 306,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 17),
                            child: SvgPicture.asset(
                              "assets/svg/mobile.svg",
                              height: 25,
                              width: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 17, right: 10),
                            child: SvgPicture.asset(
                              "assets/svg/vertical_line.svg",
                              height: 20,
                            ),
                          ),
                          StreamBuilder(
                              stream: checkUserBloc.streamData(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<CheckUserModel> snapshot) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 20, bottom: 7),
                                      child: Container(
                                          height: 21,
                                          width: 190,
                                          child: Padding(
                                            padding: EdgeInsets.only(bottom: 1),
                                            child: TextField(
                                              controller: fieldText2,
                                              onChanged: (value) {
                                                username = value;
                                              },
                                              onSubmitted: (value) {
                                                checkUserBloc.sinkData(
                                                    username, clientcode);
                                                //  otpStatus = snapshot.data!.value!.otp.toString();
                                                //  print(isOTP);
                                              },
                                              decoration: const InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          bottom: 15),
                                                  border: InputBorder.none,
                                                  hintText: "Mobile Number"
                                                  //  hintText:snapshot.data?.resultMessage,
                                                  ),
                                            ),
                                          )),
                                    ),
                                  ],
                                );
                              }),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              StreamBuilder(
                  stream: checkUserBloc.streamData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<CheckUserModel> snapshot) {
                    if (snapshot.hasData) {
                      otpStatus = snapshot.data!.value!.isOTP.toString();
                      success = snapshot.data?.success.toString();
                      print(otpStatus);
                      return InkWell(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 28, right: 26, top: 17),
                          child: Container(
                            height: 50, width: 321,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(16),
                            ),

///////////////////////////////////////  OTP  BUTTON  CONDITION   //////////////////////////////////////////////
                            child: otpStatus.toString() == false.toString()
                                ? Row(
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 17),
                                        child: SvgPicture.asset(
                                          "assets/svg/password_symbol_text.svg",
                                          height: 21,
                                          width: 21,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 17, right: 17),
                                        child: SvgPicture.asset(
                                          "assets/svg/vertical_line.svg",
                                          height: 18,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, bottom: 7),
                                            child: Container(
                                              height: 21,
                                              width: 158,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 1),
                                                child: TextField(
                                                  controller: fieldText3,
                                                  onChanged: (value) {
                                                    password = value;
                                                    // checkUserBloc.sinkData(username,password);
                                                  },
                                                  onSubmitted: (value) {
                                                    userAuthBloc.sinkData(
                                                        username,
                                                        password,
                                                        clientcode);
                                                  },
                                                  obscureText: false,
                                                  obscuringCharacter: "*",
                                                  decoration:
                                                      const InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            bottom: 15),
                                                    border: InputBorder.none,
                                                    hintText: "Password",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Container(
                                              height: 18,
                                              child: const Text("Show",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          35, 133, 59, 1),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12))))
                                    ],
                                  )
                                : ElevatedButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => OtpPage(),
                                        )),
                                    child: Text("OTP",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromRGBO(
                                                    35, 133, 59, 1)))),
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      throw Exception("error");
                    }
                    return Text("");
                  }),
              Padding(
                padding: const EdgeInsets.only(
                    left: 126, right: 27, top: 17, bottom: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: ForgotPass(),
                            ),
                          );
                          print(isOTP);
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color.fromRGBO(35, 133, 59, 1)),
                        ))
                  ],
                ),
              ),
              StreamBuilder(
                  stream: userAuthBloc.streamData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<UserAuthModel> snapshot) {
                    if (snapshot.hasData) {
                      resultMessage = snapshot.data!.resultMessage.toString();
                      box.write(
                          'token', snapshot.data!.value!.token.toString());
                      //  print(box.read('token'));

                      return Padding(
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
                                  onPressed: () {
                                    setState(() {
                                      clearText();
                                    });
                                    print(resultMessage);

                                    if (resultMessage.toString() ==
                                        "Authorized") {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: const HomePage(),
                                        ),
                                      );
                                    }
                                    ;
                                    SnackBar(content: Text("Not Authorized"));
                                  },
                                  child: Text("Login",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromRGBO(35, 133, 59, 1))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Text("");
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                        top: 17,
                      ),
                      child: SvgPicture.asset("assets/svg/or_svg.svg",
                          width: 210, height: 18))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 17, left: 26, right: 26),
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
                              child: SvgPicture.asset(
                                  "assets/svg/continue_guest_svg.svg"),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(35, 133, 59, 1))),
                            )))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 17,
                    ),
                    child: Text("Don't have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 6, bottom: 27),
                    child: Text("Create New Account",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color.fromRGBO(35, 133, 59, 1))),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
