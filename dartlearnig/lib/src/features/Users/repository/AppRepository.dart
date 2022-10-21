import 'package:shelf/shelf.dart';

class AppRepository{
  Future<String> postUsers() async {
    return 'postUsers';
  }

  Future<bool> putUsers() async {
    return false;
  }

  Future<bool> putPassword() async {
    return false;
  }

  Future<bool> deleteUser() async {
    return false;
  }
}
