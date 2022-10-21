import 'package:mysql_utils/mysql_utils.dart';

class ConfigDatabase {
  MysqlUtils ConnectionDB() {
    MysqlUtils conn = MysqlUtils(
        settings: {
          'host': '127.0.0.1',
          'port': 3308,
          'user': 'Lucas',
          'password': 'Go7/flo2',
          'db': 'projeto',
          'maxConnections': 10,
          'secure': true,
          'prefix': 'prefix_',
          'pool': true,
          'collation': 'utf8mb4_general_ci',
        },
        errorLog: (error) {
          print(error);
        },
        sqlLog: (sql) {
          print(sql);
        },
        connectInit: (db1) async {
          print('ConnectionDB Success');
        });

    return conn;
  }
}
