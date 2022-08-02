import 'package:get_storage/get_storage.dart';

class Constants {
  static final box = GetStorage();

  static const host ="http://ttms.turboinfotech.com/api/";
  static const getUserVerification="appusers/GetUserVerificationBy";
  static const authenticateuser="appusers/authenticateuser";
  static const userlogout="appusers/userlogout";
  static const resetPassword="appusers/resetPassword";
}