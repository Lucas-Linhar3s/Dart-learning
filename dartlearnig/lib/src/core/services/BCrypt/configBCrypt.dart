import 'package:bcrypt/bcrypt.dart';

class ConfigBCrypt {
  String generateBCrypt(String password) {
    return BCrypt.hashpw(password, BCrypt.gensalt());
  }

  bool veridyBCrypt({required String password, required String passHash}) {
    return BCrypt.checkpw(password, passHash);
  }
}
