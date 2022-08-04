import 'package:erp_app/api/api_service.dart';

class Repository extends ApiService {
  repoCheckUser(username, clientcode) {
    final apiService = ApiService();
    return apiService.checkUser(username, clientcode);
  }

  repoUserAuth(username, password, clientcode) {
    final apiService = ApiService();
    return apiService.authenticateUser(username, password, clientcode);
  }

  repoChangePass(token, currentpass, newpass) {
    final apiService = ApiService();
    return apiService.changePass(token, currentpass, newpass);
  }

  repoLogout(token) {
    final apiService = ApiService();
    return apiService.logout(token);
  }
}
