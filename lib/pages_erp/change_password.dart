import 'package:erp_app/bloc/change_pass_bloc/change_pass_bloc.dart';
import 'package:erp_app/pages_erp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:velocity_x/velocity_x.dart';

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
            body: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: SvgPicture.asset("assets/svg/change_pass.svg"),
          ),
          Text(
            "Change Password",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
          HeightBox(15),
          SvgPicture.asset(
            "assets/svg/green_dots.svg",
            width: 88,
            height: 8,
          ),
          HeightBox(15),
          Text(
            "Your new password must be different",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Text("from previous used passwords.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          HeightBox(15),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder(
                      stream: changePassBloc.streamData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return Container(
                          alignment: Alignment.center,
                          height: 60,
                          // width: 350,
                          decoration: BoxDecoration(
                              // color: Color.fromRGBO(245, 245, 245, 1),
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
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

                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Old Password",
                              border: InputBorder.none,
                              prefixIcon: Image.asset(
                                "assets/svg/ic_password.png",
                                scale: 4,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        );
                      }),
                  HeightBox(20),
                  StreamBuilder(
                      stream: changePassBloc.streamData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          success = snapshot.data.success.toString();
                          // print(success);
                        }
                        return Container(
                          alignment: Alignment.center,
                          height: 60,
                          // width: 350,
                          decoration: BoxDecoration(
                              // color: Color.fromRGBO(245, 245, 245, 1),
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
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
                        );
                      }),
                  HeightBox(20),
                  StreamBuilder(
                      stream: changePassBloc.streamData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        print(token);

                        return Container(
                          alignment: Alignment.center,
                          height: 60,
                          // width: 350,
                          decoration: BoxDecoration(
                              // color: Color.fromRGBO(245, 245, 245, 1),
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
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
                        );
                      }),
                  HeightBox(5),
                  Text(
                    "Both passwords must Match.",
                    style: TextStyle(
                        color: Color.fromARGB(255, 126, 117, 117),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  HeightBox(20),
                  StreamBuilder(
                      stream: changePassBloc.streamData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        success = snapshot.hasData.toString();
                        print(success);
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (success == true.toString()) {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          // curve: Curves.easeInOut,
                                          // duration: const Duration(
                                          //     milliseconds: 300),
                                          type: PageTransitionType.rightToLeft,
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
                                  child: const Text("Submit",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromRGBO(
                                                  35, 133, 59, 1))),
                                )));
                      }),
                ],
              ),
            ),
          ),

          // Container(
          //   height: 50,
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(
          //     border: Border.all(color: Colors.grey),
          //     borderRadius: BorderRadius.circular(16),
          //   ),
          //   child: Row(
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(left: 17),
          //         child: SvgPicture.asset(
          //           "assets/svg/password_symbol_text.svg",
          //           height: 21,
          //           width: 21,
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 17, right: 17),
          //         child: SvgPicture.asset(
          //           "assets/svg/vertical_line.svg",
          //           height: 18,
          //         ),
          //       ),
          //       // StreamBuilder<dynamic>(
          //       //     stream: changePassBloc.streamData(),
          //       //     builder:
          //       //         (BuildContext context, AsyncSnapshot snapshot) {
          //       //       // print(token);
          //       //       return Column(
          //       //         children: [
          //       //           Padding(
          //       //             padding: const EdgeInsets.only(
          //       //                 top: 20, bottom: 7),
          //       //             child: Container(
          //       //                 height: 21,
          //       //                 width: 160,
          //       //                 child: Padding(
          //       //                   padding: EdgeInsets.only(bottom: 1),
          //       //                   child: TextField(
          //       //                     // onChanged: (value) {
          //       //                     //     currentPassword=value;
          //       //                     //     //   password= value.toString();
          //       //                     //     // print(resultMessage);

          //       //                     //   },
          //       //                     // onEditingComplete:(){
          //       //                     //    changePassBloc.sinkData(password);
          //       //                     // } ,
          //       //                     onSubmitted: (value) {
          //       //                       currentpass = value;
          //       //                       changePassBloc.sinkData(
          //       //                           token, newpass, currentpass);
          //       //                     },

          //       //                     obscureText: false,
          //       //                     // obscuringCharacter: "*",

          //       //                     decoration: const InputDecoration(
          //       //                       contentPadding:
          //       //                           EdgeInsets.only(bottom: 15),
          //       //                       border: InputBorder.none,
          //       //                       hintText: "Old Password",
          //       //                     ),
          //       //                   ),
          //       //                 )),
          //       //           ),
          //       //         ],
          //       //       );
          //       //     }),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 19),
          //         child: Container(
          //             height: 18,
          //             child: Text(
          //               "Show",
          //               style: TextStyle(
          //                   color: Color.fromRGBO(35, 133, 59, 1),
          //                   fontWeight: FontWeight.w600,
          //                   fontSize: 12),
          //             )),
          //       )
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding:
          //       const EdgeInsets.only(bottom: 17, left: 28, right: 26),
          //   child: Container(
          //     height: 50,
          //     width: MediaQuery.of(context).size.width,
          //     decoration: BoxDecoration(
          //       border: Border.all(color: Colors.grey),
          //       borderRadius: BorderRadius.circular(16),
          //     ),
          //     child: Row(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.only(left: 17),
          //           child: SvgPicture.asset(
          //             "assets/svg/password_symbol_text.svg",
          //             height: 21,
          //             width: 21,
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only(left: 17, right: 17),
          //           child: SvgPicture.asset(
          //             "assets/svg/vertical_line.svg",
          //             height: 18,
          //           ),
          //         ),
          //         StreamBuilder<dynamic>(
          //             stream: changePassBloc.streamData(),
          //             builder: (BuildContext context,
          //                 AsyncSnapshot snapshot) {
          //               if (snapshot.hasData) {
          //                 success = snapshot.data.success.toString();
          //                 // print(success);
          //               }

          //               return Column(
          //                 children: [
          //                   Padding(
          //                     padding: const EdgeInsets.only(
          //                         top: 20, bottom: 7),
          //                     child: Container(
          //                         height: 21,
          //                         width: 148,
          //                         child: Padding(
          //                           padding: EdgeInsets.only(bottom: 1),
          //                           child: TextField(
          //                             //  onChanged: (value) {
          //                             //      newPassword= value;

          //                             //     },
          //                             // onEditingComplete:(){
          //                             //   //  checkUserBloc.sinkData(username);
          //                             // } ,
          //                             onSubmitted: (value) {
          //                               newpass = value.toString();
          //                               changePassBloc.sinkData(token,
          //                                   currentpass, newpass);
          //                             },
          //                             obscureText: false,
          //                             // obscuringCharacter: "*",
          //                             decoration: const InputDecoration(
          //                               contentPadding:
          //                                   EdgeInsets.only(bottom: 15),
          //                               border: InputBorder.none,
          //                               hintText: "New Password",
          //                             ),
          //                           ),
          //                         )),
          //                   ),
          //                 ],
          //               );
          //             }),
          //         Padding(
          //           padding: const EdgeInsets.only(left: 30),
          //           child: Container(
          //               height: 18,
          //               child: Text(
          //                 "Show",
          //                 style: TextStyle(
          //                     color: Color.fromRGBO(35, 133, 59, 1),
          //                     fontWeight: FontWeight.w600,
          //                     fontSize: 12),
          //               )),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 28, right: 26),
          //   child: Container(
          //     height: 50,
          //     width: MediaQuery.of(context).size.width,
          //     decoration: BoxDecoration(
          //       border: Border.all(color: Colors.grey),
          //       borderRadius: BorderRadius.circular(16),
          //     ),
          //     child: Row(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.only(left: 17),
          //           child: SvgPicture.asset(
          //             "assets/svg/password_symbol_text.svg",
          //             height: 21,
          //             width: 21,
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only(left: 17, right: 17),
          //           child: SvgPicture.asset(
          //             "assets/svg/vertical_line.svg",
          //             height: 18,
          //           ),
          //         ),
          //         StreamBuilder<dynamic>(
          //             stream: changePassBloc.streamData(),
          //             builder: (BuildContext context,
          //                 AsyncSnapshot snapshot) {
          //               print(token);

          //               return Column(
          //                 children: [
          //                   Padding(
          //                     padding: const EdgeInsets.only(
          //                         top: 20, bottom: 7),
          //                     child: Container(
          //                         height: 21,
          //                         width: 148,
          //                         child: const Padding(
          //                           padding: EdgeInsets.only(bottom: 1),
          //                           child: TextField(
          //                             // onChanged: (value) {
          //                             //      newPassword= value;

          //                             //     },
          //                             // onEditingComplete:(){
          //                             //    changePassBloc.sinkData(newPassword);
          //                             // } ,
          //                             // onSubmitted:(value){
          //                             //   newpass= value;
          //                             //     changePassBloc.sinkData(token,currentpass,newpass);
          //                             // } ,
          //                             obscureText: false,
          //                             // obscuringCharacter: "*",
          //                             decoration: InputDecoration(
          //                               contentPadding:
          //                                   EdgeInsets.only(bottom: 15),
          //                               border: InputBorder.none,
          //                               hintText: "Confirm Password",
          //                             ),
          //                           ),
          //                         )),
          //                   ),
          //                 ],
          //               );
          //             }),
          //         Padding(
          //           padding: const EdgeInsets.only(left: 30),
          //           child: Container(
          //               height: 18,
          //               child: Text(
          //                 "Show",
          //                 style: TextStyle(
          //                     color: Color.fromRGBO(35, 133, 59, 1),
          //                     fontWeight: FontWeight.w600,
          //                     fontSize: 12),
          //               )),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // const Padding(
          //   padding: EdgeInsets.only(
          //       left: 10, right: 120, bottom: 17, top: 5),
          //   child: Text("Both Passwords must match.",
          //       style: TextStyle(
          //           color: Color.fromARGB(255, 126, 117, 117),
          //           fontSize: 12,
          //           fontWeight: FontWeight.w500)),
          // ),
          // StreamBuilder(
          //     stream: changePassBloc.streamData(),
          //     builder: (BuildContext context, AsyncSnapshot snapshot) {
          //       success = snapshot.hasData.toString();
          //       print(success);

          //       return Padding(
          //         padding: const EdgeInsets.only(left: 26, right: 25),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             ClipRRect(
          //                 borderRadius: BorderRadius.circular(16),
          //                 child: Container(
          //                     height: 50,
          //                     width: 305,
          //                     child: ElevatedButton(
          //                       onPressed: () {
          //                         if (success == true.toString()) {
          //                           Navigator.push(
          //                             context,
          //                             PageTransition(
          //                               // curve: Curves.easeInOut,
          //                               // duration: const Duration(
          //                               //     milliseconds: 300),
          //                               type: PageTransitionType
          //                                   .rightToLeft,
          //                               child: const HomePage(),
          //                               // inheritTheme: true,
          //                               // ctx: context
          //                             ),
          //                           );
          //                         } else {
          //                           const SnackBar(
          //                               content:
          //                                   Text("Wrong Entries!!!!"));
          //                         }
          //                         // resultMessage=snapshot.hasData.toString();
          //                         // // print(resultMessage);
          //                       },
          //                       child: Text("Submit",
          //                           style: TextStyle(
          //                               fontSize: 14,
          //                               fontWeight: FontWeight.w500)),
          //                       style: ButtonStyle(
          //                           backgroundColor:
          //                               MaterialStateProperty.all(
          //                                   Color.fromRGBO(
          //                                       35, 133, 59, 1))),
          //                     )))
          //           ],
          //         ),
          //       );
          //     }),
        ])));
  }
}
