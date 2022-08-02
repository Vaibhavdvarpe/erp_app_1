import 'package:erp_app/bloc/user_verification_bloc/user_verfication_bloc.dart';
import 'package:erp_app/pages_erp/change_password.dart';
import 'package:erp_app/pages_erp/forgot_pass.dart';
import 'package:erp_app/pages_erp/homepage.dart';
import 'package:erp_app/pages_erp/loginpage.dart';
import 'package:erp_app/pages_erp/otp_page.dart';

import 'package:flutter/material.dart';
import 'package:erp_app/pages_erp/get_started_page.dart';
import 'package:erp_app/utils/routes/routes.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(ErpApp());
}

class ErpApp extends StatefulWidget {
  @override
  State<ErpApp> createState() => _ErpAppState();
}

class _ErpAppState extends State<ErpApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CheckUserBloc(null),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          checkerboardOffscreenLayers: false,
          initialRoute: MyRoutes.get_startedRoute,
          routes: {
            // "/":(context) => getStarted(),
            MyRoutes.get_startedRoute: (context) =>
                SafeArea(child: getStarted()),
            MyRoutes.LoginPageRoute: (context) => SafeArea(child: LoginPage()),
            MyRoutes.ForgotPassRoute: (context) =>
                SafeArea(child: ForgotPass()),
            MyRoutes.ChangePassRoute: (context) =>
                SafeArea(child: ChangePass()),
            MyRoutes.OtpPageRoute: (context) => SafeArea(child: OtpPage()),
            MyRoutes.HomePageRoute: (context) => SafeArea(child: HomePage()),
          },
        ));
  }
}
