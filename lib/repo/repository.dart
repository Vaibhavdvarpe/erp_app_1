import 'package:erp_app/api/api_service.dart';


class Repository extends ApiService
{
    repoCheckUser(username) {
    final apiService = ApiService();
    return apiService.checkUser(username);
  }

    repoUserAuth(username, password) {
    final apiService = ApiService();
    return apiService.authenticateUser(username, password);
  }

   repoChangePass(token,currentpass,newpass) {
    final apiService = ApiService();
    return apiService.changePass(token,currentpass,newpass);
  }

  repoLogout(token) {
    final apiService = ApiService();
    return apiService.logout(token);
  }
}