import 'package:dartlearnig/src/core/services/BCrypt/configBCrypt.dart';
import 'package:dartlearnig/src/core/services/database/db.dart';
import 'package:dartlearnig/src/features/Users/domain/models/modelUsers.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'package:shelf/shelf.dart';

class AppRepository {
  MysqlUtils db = ConfigDatabase().ConnectionDB();
  Future<Map<String, Object>> postUsers(ModelUsers users) async {
    final passHash = ConfigBCrypt().generateBCrypt(users.password);
    final query = await db.query(
        'INSERT INTO `Users`(name, email, password) VALUES (:name, :email, :password)',
        values: {
          'name': users.name,
          'email': users.email,
          'password': passHash,
        });
    if (query.lastInsertID != 0) {
      final map = {
        'id': query.lastInsertID,
        'name': users.name,
        'email': users.email,
      };
      return map;
    } else {
      final mapError = {
        'messageError': ['error', 'error inserting user']
      };
      db.close();
      return mapError;
    }
  }

  Future<ResultFormat> putUsers(ModelUsers users) async {
    final query = await db.query(
        'UPDATE `Users` SET name=:name, email=:email WHERE id=:id',
        values: {
          'name': users.name,
          'email': users.email,
          'id': users.id,
        });
    return query;
  }

  Future<String> putPassword(String password, String id) async {
    final hashpq = ConfigBCrypt().generateBCrypt(password);
    final query = await db.query(
        'UPDATE `Users` SET password=:password WHERE id=:id;',
        values: {'password': hashpq, 'id': id});
    if (query.affectedRows != 0) {
      return "Senha atualizada com successo";
    } else {
      return "Erro ao atualizar senha";
    }
  }

  Future<ResultFormat> deleteUser(String id) async {
    final query =
        await db.query('DELETE FROM `Users` WHERE id=:id;', values: {'id': id});
    return query;
  }
}
