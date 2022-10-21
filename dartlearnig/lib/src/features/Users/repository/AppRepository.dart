import 'package:dartlearnig/src/core/services/database/db.dart';
import 'package:dartlearnig/src/features/Users/domain/models/modelUsers.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'package:shelf/shelf.dart';

class AppRepository {
  MysqlUtils db = ConfigDatabase().ConnectionDB();
  Future<Map<String, Object>> postUsers(ModelUsers users) async {
    final query = await db.query(
        'INSERT INTO `Users`(name, email, password) VALUES (:name, :email, :password)',
        values: {
          'name': users.name,
          'email': users.email,
          'password': users.password,
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
