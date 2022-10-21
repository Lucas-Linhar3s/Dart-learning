import 'package:dartlearnig/src/features/Users/repository/AppRepository.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class AppController {
  AppRepository _repository = AppRepository();
  Future<Response> postUsers(ModularArguments req) async {
    final result = _repository.postUsers();
    return Response(200, body: 'postUsers');
  }

  Future<Response> putUsers(ModularArguments req) async {
    final result = _repository.putUsers();
    return Response(200, body: 'putUsers');
  }

  Future<Response> putPassword(ModularArguments req) async {
    final result = _repository.putPassword();
    return Response(200, body: 'putPassword');
  }

  Future<Response> deleteUser(ModularArguments req) async {
    final result = _repository.deleteUser();
    return Response(200, body: 'deleteUser');
  }
}
