import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {
  final ip = InternetAddress.anyIPv4;

  final int port = int.parse(Platform.environment['PORT'] ?? '8080');

  final router = Router()
    ..get('/home', (Request req) {
      return Response.ok("This is HOME page");
    })
    ..get('/setting', (Request req) {
      return Response.ok("This is SETTING page");
    })
    ..get('/profile', (Request req) {
      return Response.ok("This is PROFILE page");
    });

  final server = await serve(router, ip, port);

  print("server is listening at http://${server.address.host}:${server.port}");
}
