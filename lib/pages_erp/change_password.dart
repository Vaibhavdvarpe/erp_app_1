import 'package:erp_app/bloc/change_pass_bloc/change_pass_bloc.dart';
import 'package:erp_app/pages_erp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  String? username = '';
  String? password = '';
  String? token = '';
  String? currentpass = '';
  String? newpass = '';
  String? resultMessage = '';
  String? success = '';
  String? resultStatus = '';

  @override
  Widget build(BuildContext context) {
    // changePassBloc.sinkData(token, currentpass, newpass);
    return
        //  MaterialApp(
        //     theme: ThemeData(
        //         textTheme:
        //             GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
        //     debugShowCheckedModeBanner: false,
        //     home: Container(
        //         color: Colors.white,
        //         width: MediaQuery.of(context).size.width,
        //         height: MediaQuery.of(context).size.height,
        //         child:
        Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.keyboard_arrow_left_sharp,
                    size: 35,
                  )),
              iconTheme: IconThemeData(color: Color.fromRGBO(35, 133, 59, 1)),
              backgroundColor: Color.fromARGB(255, 253, 249, 249),
              elevation: 0,
            ),
            body: SingleChildScrollView(
                child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 63, right: 47, top: 44, bottom: 17),
                    child: Container(
                      width: 150,
                      height: 150,
                      child: SvgPicture.asset("assets/svg/change_pass.svg"),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Change Password",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 17,
                ),
                child: SvgPicture.asset(
                  "assets/svg/green_dots.svg",
                  width: 88,
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
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 21, left: 28, right: 26, bottom: 17),
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
                      StreamBuilder<dynamic>(
                          stream: changePassBloc.streamData(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            // print(token);
                            return Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, bottom: 7),
                                  child: Container(
                                      height: 21,
                                      width: 160,
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 1),
                                        child: TextField(
                                          // onChanged: (value) {
                                          //     currentPassword=value;
                                          //     //   password= value.toString();
                                          //     // print(resultMessage);

                                          //   },
                                          // onEditingComplete:(){
                                          //    changePassBloc.sinkData(password);
                                          // } ,
                                          onSubmitted: (value) {
                                            currentpass = value;
                                            changePassBloc.sinkData(
                                                token, newpass, currentpass);
                                          },

                                          obscureText: false,
                                          // obscuringCharacter: "*",

                                          decoration: const InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(bottom: 15),
                                            border: InputBorder.none,
                                            hintText: "Old Password",
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.only(left: 19),
                        child: Container(
                            height: 18,
                            child: Text(
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
              Padding(
                padding: const EdgeInsets.only(bottom: 17, left: 28, right: 26),
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
                      StreamBuilder<dynamic>(
                          stream: changePassBloc.streamData(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              success = snapshot.data.success.toString();
                              // print(success);
                            }

                            return Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, bottom: 7),
                                  child: Container(
                                      height: 21,
                                      width: 148,
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 1),
                                        child: TextField(
                                          //  onChanged: (value) {
                                          //      newPassword= value;

                                          //     },
                                          // onEditingComplete:(){
                                          //   //  checkUserBloc.sinkData(username);
                                          // } ,
                                          onSubmitted: (value) {
                                            newpass = value.toString();
                                            changePassBloc.sinkData(
                                                token, currentpass, newpass);
                                          },
                                          obscureText: false,
                                          // obscuringCharacter: "*",
                                          decoration: const InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(bottom: 15),
                                            border: InputBorder.none,
                                            hintText: "New Password",
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                            height: 18,
                            child: Text(
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
              Padding(
                padding: const EdgeInsets.only(left: 28, right: 26),
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
                      StreamBuilder<dynamic>(
                          stream: changePassBloc.streamData(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            print(token);

                            return Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, bottom: 7),
                                  child: Container(
                                      height: 21,
                                      width: 148,
                                      child: const Padding(
                                        padding: EdgeInsets.only(bottom: 1),
                                        child: TextField(
                                          // onChanged: (value) {
                                          //      newPassword= value;

                                          //     },
                                          // onEditingComplete:(){
                                          //    changePassBloc.sinkData(newPassword);
                                          // } ,
                                          // onSubmitted:(value){
                                          //   newpass= value;
                                          //     changePassBloc.sinkData(token,currentpass,newpass);
                                          // } ,
                                          obscureText: false,
                                          // obscuringCharacter: "*",
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(bottom: 15),
                                            border: InputBorder.none,
                                            hintText: "Confirm Password",
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                            height: 18,
                            child: Text(
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
                padding:
                    EdgeInsets.only(left: 10, right: 120, bottom: 17, top: 5),
                child: Text("Both Passwords must match.",
                    style: TextStyle(
                        color: Color.fromARGB(255, 126, 117, 117),
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              ),
              StreamBuilder(
                  stream: changePassBloc.streamData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    success = snapshot.hasData.toString();
                    print(success);

                    return Padding(
                      padding: const EdgeInsets.only(left: 26, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                  height: 50,
                                  width: 305,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (success == true.toString()) {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            // curve: Curves.easeInOut,
                                            // duration: const Duration(
                                            //     milliseconds: 300),
                                            type:
                                                PageTransitionType.rightToLeft,
                                            child: const HomePage(),
                                            // inheritTheme: true,
                                            // ctx: context
                                          ),
                                        );
                                      } else {
                                        const SnackBar(
                                            content: Text("Wrong Entries!!!!"));
                                      }
                                      // resultMessage=snapshot.hasData.toString();
                                      // // print(resultMessage);
                                    },
                                    child: Text("Submit",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500)),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromRGBO(
                                                    35, 133, 59, 1))),
                                  )))
                        ],
                      ),
                    );
                  }),
            ])));
  }
}
