import 'dart:ffi';
import 'dart:io';

import 'package:dartlearnig/src/core/services/dot_env/dot_env.dart';
import 'package:dartlearnig/src/core/services/router/routes/routes.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf_modular/shelf_modular.dart';

class CustomServer {
  Handler _handlerModules = Modular(
    module: AppRoutes(),
    middlewares: [
      logRequests(),
      corsHeaders(),
    ],
  );



  Future<void> ConnectionServer() async {
    final server = await io
        .serve(_handlerModules, '0.0.0.0', 8080)
        .then((value) => print('Server running http://localhost:${value.port}'))
        .catchError(() {
      print('Erro running server');
    });

    return server;
  }
}
