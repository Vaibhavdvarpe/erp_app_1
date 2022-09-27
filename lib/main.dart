import 'package:erp_app/bloc/user_verification_bloc/user_verfication_bloc.dart';
import 'package:erp_app/widgets/bottomsheet.dart';
import 'package:erp_app/pages_erp/change_password.dart';
import 'package:erp_app/pages_erp/forgot_pass.dart';
import 'package:erp_app/pages_erp/homepage.dart';
import 'package:erp_app/widgets/loginpage.dart';
import 'package:erp_app/pages_erp/otp_page.dart';

import 'package:flutter/material.dart';
import 'package:erp_app/pages_erp/get_started_page.dart';
import 'package:erp_app/utils/routes/routes.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeLeft,
    // DeviceOrientation.landscapeRight
  ]);

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
          builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget!),
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
          ),
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                color: Color.fromRGBO(35, 133, 59, 1),
                systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
              ),
              textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
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
            MyRoutes.BottomsheetRoute: (context) =>
                SafeArea(child: Botttomsheet()),
          },
        ));
  }
}
