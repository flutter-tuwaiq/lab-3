import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

final _router = Router()
  ..get('/home', _firstHandler)
  ..get('/login', _secondHandler)
  ..get("/signin", _thirdHandler);

Response _firstHandler(Request req) {
  return Response.ok('Home page');
}

Response _secondHandler(Request request) {
  return Response.ok('login page');
}

Response _thirdHandler(Request request) {
  return Response.ok('signin page');
}

void main(List<String> args) async {
  final ip = InternetAddress.anyIPv4;
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
