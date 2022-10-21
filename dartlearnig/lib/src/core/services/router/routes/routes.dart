import 'package:dartlearnig/src/features/Users/controller/AppController.dart';
import 'package:shelf_modular/shelf_modular.dart';

class AppRoutes extends Module {
  AppController Users = AppController();
  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
        Route.post('/user', Users.postUsers),
        Route.put('/user', Users.putUsers),
        Route.put('/user', Users.putPassword),
        Route.delete('/user/:id', Users.deleteUser),
      ];
}
