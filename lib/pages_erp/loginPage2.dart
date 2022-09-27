import 'package:erp_app/pages_erp/forgot_pass.dart';
import 'package:erp_app/pages_erp/homepage.dart';
import 'package:erp_app/pages_erp/otp_page.dart';
import 'package:erp_app/screens2/accountMaster.dart';
import 'package:erp_app/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:erp_app/widgets/constants.dart';

import '../bloc/user_auth_bloc/authmodel.dart';
import '../bloc/user_auth_bloc/user_auth_bloc.dart';
import '../bloc/user_auth_bloc/user_auth_bloc.dart';
import '../bloc/user_verification_bloc/check_user_model.dart';
import '../bloc/user_verification_bloc/user_verfication_bloc.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({Key? key}) : super(key: key);

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 20, width: double.infinity, color: C.loginimageColor),
            Image.asset(
              "assets/images/erp_login.png",
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
            ),
            ClipRect(
              child: Card(
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(30)),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text("LOGIN",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 24)),
                        SizedBox(
                          height: 15,
                        ),
                        Text("To Continue ERP App",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16)),
                        SizedBox(
                          height: 15,
                        ),
                        SvgPicture.asset("assets/svg/green_dots.svg",
                            width: 88, height: 6),
                        HeightBox(15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StreamBuilder(
                                stream: checkUserBloc.streamData(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<CheckUserModel> snapshot) {
                                  return Container(
                                    alignment: Alignment.center,
                                    height: 60,
                                    // width: 350,
                                    decoration: BoxDecoration(
                                        // color: Color.fromRGBO(245, 245, 245, 1),
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: TextField(
                                      controller: fieldText1,
                                      onChanged: (value) {
                                        clientcode = value;
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: "Enter Client Code",
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          CupertinoIcons.person_circle,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                            HeightBox(15),
                            StreamBuilder(
                                stream: checkUserBloc.streamData(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<CheckUserModel> snapshot) {
                                  return Container(
                                    alignment: Alignment.center,
                                    height: 60,
                                    // width: 350,
                                    decoration: BoxDecoration(
                                        // color: Color.fromRGBO(245, 245, 245, 1),
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(15)),
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
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: "Enter Mobile Number",
                                          border: InputBorder.none,
                                          prefixIcon: Icon(
                                            // CupertinoIcons.device_phone_portrait,
                                            Icons.phone_android,
                                            size: 30,
                                          )),
                                    ),
                                  );
                                }),
                            HeightBox(15),
                            StreamBuilder(
                                stream: checkUserBloc.streamData(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<CheckUserModel> snapshot) {
                                  if (snapshot.hasData) {
                                    otpStatus =
                                        snapshot.data!.value!.isOTP.toString();
                                    success = snapshot.data?.success.toString();
                                    print(otpStatus);
                                    return InkWell(
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 60,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),

                                        ///////////////////////////////////////  OTP  BUTTON  CONDITION   //////////////////////////////////////////////
                                        child: otpStatus.toString() ==
                                                false.toString()
                                            ? TextField(
                                                controller: fieldText3,
                                                onChanged: (value) {
                                                  password = value;
                                                },
                                                onSubmitted: (value) {
                                                  userAuthBloc.sinkData(
                                                      username,
                                                      password,
                                                      clientcode);
                                                },
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  hintText: "Password",
                                                  border: InputBorder.none,
                                                  prefixIcon: Image.asset(
                                                    "assets/svg/ic_password.png",
                                                    scale: 4,
                                                    color: Colors.grey,
                                                  ),

                                                  // prefixIcon: Icon(
                                                  //   // CupertinoIcons.device_phone_portrait,
                                                  //   Icons.phone_android,
                                                  //   size: 30,
                                                  // )
                                                ),
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: SizedBox(
                                                  height: 60,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: ElevatedButton(
                                                    onPressed: () =>
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      OtpPage(),
                                                            )),
                                                    child: Text("OTP",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(C.appGreen),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    throw Exception("error");
                                  }
                                  return Text("");
                                }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: AccountMaster(),
                                        ),
                                      );
                                      // print(isOTP);
                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: C.appGreen),
                                    ))
                              ],
                            ),
                            StreamBuilder(
                                stream: userAuthBloc.streamData(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<UserAuthModel> snapshot) {
                                  if (snapshot.hasData) {
                                    resultMessage =
                                        snapshot.data!.resultMessage.toString();
                                    box.write('token',
                                        snapshot.data!.value!.token.toString());
                                    //  print(box.read('token'));
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: SizedBox(
                                        height: 60,
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                                  type: PageTransitionType
                                                      .rightToLeft,
                                                  child: const HomePage(),
                                                ),
                                              );
                                            }
                                            ;
                                            SnackBar(
                                                content:
                                                    Text("Not Authorized"));
                                          },
                                          child: Text("Login",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromRGBO(
                                                        35, 133, 59, 1)),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return Text("");
                                }),
                            HeightBox(15),
                            SvgPicture.asset("assets/svg/or_svg.svg",
                                width: 210, height: 18),
                            HeightBox(15),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                    height: 60,
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.person_outline),
                                          Text("Continue as Guest")
                                        ],
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color.fromRGBO(
                                                      35, 133, 59, 1))),
                                    ))),
                            HeightBox(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Don't have an account?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16))
                              ],
                            ),
                            HeightBox(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Create New Account",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: C.appGreen))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
