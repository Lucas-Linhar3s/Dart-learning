import 'dart:convert';

import 'package:dartlearnig/src/features/Users/domain/models/modelUsers.dart';
import 'package:dartlearnig/src/features/Users/repository/AppRepository.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class AppController {
  final _jsonResponse = {'Content-Type': 'application/json'};

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
    ModelUsers users = ModelUsers(
        id: req.data['id'],
        name: req.data['name'],
        email: req.data['email'],
        password: "");
    final result = await _repository.putUsers(users);
    if (result.affectedRows != 0) {
      final map = {
        'id': users.id,
        'name': users.name,
        'email': users.email,
      };
      return Response(200, body: jsonEncode(map), headers: _jsonResponse);
    } else {
      final map = {
        'error': 'Deu error ao atualizar usuarios com id ${users.id}'
      };
      return Response(500, body: jsonEncode(map), headers: _jsonResponse);
    }
  }

  Future<Response> putPassword(ModularArguments req) async {
    final paramsID = req.params['id'];
    final Newpassword = req.data['newPassword'];
    final ConPassword = req.data['conPassword'];
    if (Newpassword == ConPassword) {
      final result = await _repository.putPassword(ConPassword, paramsID);
      return Response(200, body: result);
    } else {
      return Response(500, body: "Senhas nao conferem");
    }
  }

  Future<Response> deleteUser(ModularArguments req) async {
    final result = _repository.deleteUser();
    return Response(200, body: 'deleteUser');
  }
}
