import 'package:erp_app/bloc/user_logout_bloc/user_logout_bloc.dart';
import 'package:erp_app/pages_erp/change_password.dart';
import 'package:erp_app/screens2/accountMaster.dart';
import 'package:erp_app/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:page_transition/page_transition.dart';

import 'loginPage2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? token = '';
  String? resultMessage = '';
  String? successStatus = '';
  String? success = '';

  @override
  Widget build(BuildContext context) {
    var box = GetStorage();
    token = box.read('token');
    print(box.read('token'));
    // logoutBloc.sinkData;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 59,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(35, 133, 59, 1),
        title: Center(child: Text("Home Screen")),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(35, 133, 59, 1))),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const ChangePass(),
                    ),
                  );
                },
                child: Text("Change Password")),
            StreamBuilder(
                stream: logoutBloc.streamData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  // token=box.read('token');
                  success = snapshot.hasData.toString();
                  print(success);

                  return Center(
                      child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(35, 133, 59, 1))),
                    child: const Text("LogOut"),
                    onPressed: () {
                      (logoutBloc.sinkData(token));
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Logout"),
                          content: const Text(
                              "Are you Sure.? Do you want to Logout ??"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: const LoginPage2(),
                                  ),
                                );
                              },
                              child: Container(
                                // color: Colors.green,
                                padding: const EdgeInsets.all(14),
                                child: const Text(
                                  "okay",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },

                    // onPressed: () {
                    //   (logoutBloc.sinkData(token));
                    //   final snackBar = SnackBar(
                    //     content: const Text('Logout...?'),
                    //     action: SnackBarAction(
                    //       label: 'Yes',
                    //       onPressed: () {
                    //         Navigator.pop(context, MyRoutes.LoginPageRoute);
                    //       },
                    //     ),
                    //   );
                    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // },
                  ));
                }),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.rightToLeft,
                        child: const AccountMaster(),
                        inheritTheme: true,
                        ctx: context),
                  );
                },
                child: Text("Account Master"))
          ],
        ),
      ),
    );
  }
}
