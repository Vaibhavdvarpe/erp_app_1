import 'package:erp_app/pages_erp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          HeightBox(20),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new,
                        color: Color.fromRGBO(35, 133, 59, 1),
                      ),
                      Text(
                        "Back",
                        style: TextStyle(
                            color: Color.fromRGBO(35, 133, 59, 1),
                            fontSize: 20),
                      )
                    ],
                  ))
            ],
          ),
          // Row(
          //   children: [
          //     SvgPicture.asset(
          //       "assets/svg/backbutton_svg.svg",
          //       height: 42,
          //       width: 85,
          //     ),
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: SvgPicture.asset("assets/svg/bgstars_svg.svg")),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Container(
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      child: SvgPicture.asset(
                          "assets/svg/otp_verification_svg.svg"),
                    ),
                  )
                ],
              )
            ],
          ),
          HeightBox(15),
          Text(
            "OTP Verification",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
          HeightBox(10),
          SvgPicture.asset("assets/svg/green_dots.svg", width: 100, height: 8),
          HeightBox(15),
          Text("A One-Time Password (OTP) has been sent",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          Text("to your Mobile Number.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          HeightBox(15),
          Text(
            "+91 9876* ***20",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(35, 133, 59, 1)),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 11),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        counterText: '',
                        hintText: "0",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 11),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        counterText: '',
                        hintText: "0",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 11),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        counterText: '',
                        hintText: "0",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: TextField(
                    showCursor: false,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 11),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        counterText: '',
                        hintText: "0",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                )
              ],
            ),
          ),
          // HeightBox(10),
          Text("00:46",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(35, 133, 59, 1))),
          HeightBox(10),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          )),
                      child: const Text("Verify",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(35, 133, 59, 1))),
                    ))),
          ),
        ])));
  }
}
