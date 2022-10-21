import 'dart:convert';

import 'package:dartlearnig/src/features/Users/domain/models/modelUsers.dart';
import 'package:dartlearnig/src/features/Users/repository/AppRepository.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class AppController {
  AppRepository _repository = AppRepository();
  Future<Response> postUsers(ModularArguments req) async {
    ModelUsers users = ModelUsers(
      name: req.data['name'],
      email: req.data['email'],
      password: req.data['password'],
    );
    final result = await _repository.postUsers(users);
    return Response(
      201,
      body: jsonEncode(result),
      headers: {'Cotent-type': 'application/json'},
    );
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
