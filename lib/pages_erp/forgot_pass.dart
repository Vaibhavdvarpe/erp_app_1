import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgotPass extends StatelessWidget {
  ForgotPass({Key? key}) : super(key: key);
  bool _isObscure = true;
  final fieldText6 = TextEditingController();
  void clearText() {
    fieldText6.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                        color: Color.fromRGBO(35, 133, 59, 1), fontSize: 20),
                  )
                ],
              ))
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(26.0),
        child: SvgPicture.asset(
          "assets/svg/forgot_pass.svg",
          width: MediaQuery.of(context).size.width,
          height: 200,
          fit: BoxFit.fitWidth,
        ),
      ),
      HeightBox(10),
      Text(
        "Forgot Password",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
      ),
      HeightBox(10),
      SvgPicture.asset(
        "assets/svg/green_dots.svg",
        width: 70,
        height: 8,
      ),
      HeightBox(10),
      Text("Your new password must be different",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
      Text("from previous used passwords.",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
      // HeightBox(15),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: 60,
                // width: 350,
                decoration: BoxDecoration(
                    // color: Color.fromRGBO(245, 245, 245, 1),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "New Password",
                    border: InputBorder.none,
                    prefixIcon: Image.asset(
                      "assets/svg/ic_password.png",
                      scale: 4,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              HeightBox(5),
              Text(
                "Must be at least 8 Characters.",
                style: TextStyle(
                    color: Color.fromARGB(255, 126, 117, 117),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              HeightBox(20),
              Container(
                alignment: Alignment.center,
                height: 60,
                // width: 350,
                decoration: BoxDecoration(
                    // color: Color.fromRGBO(245, 245, 245, 1),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    border: InputBorder.none,
                    prefixIcon: Image.asset(
                      "assets/svg/ic_password.png",
                      scale: 4,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              HeightBox(5),
              Text(
                "Both passwords must Match.",
                style: TextStyle(
                    color: Color.fromARGB(255, 126, 117, 117),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              HeightBox(20),
              ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Reset Password",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(35, 133, 59, 1))),
                      ))),
            ],
          ),
        ),
      ),
    ])));

    //   MaterialApp(
    //       theme: ThemeData(
    //           textTheme:
    //               GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
    //       debugShowCheckedModeBanner: false,
    //       home: Container(
    //           color: Colors.white,
    //           width: MediaQuery.of(context).size.width,
    //           height: MediaQuery.of(context).size.height,
    //           child:));
    // }
  }
}
