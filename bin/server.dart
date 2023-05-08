import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {
  final ip = InternetAddress.anyIPv4;
  // final ip = 'localhost';

  final int port = int.parse(Platform.environment["PORT"] ?? "8080");

  final router = Router()
    ..get('/endpoint1', (Request req) {
      return Response.ok('Endpoint #1');
    })
    ..get('/endpoint2', (Request req) {
      return Response.ok('Endpoint #2');
    })
    ..get('/endpoint3', (Request req) {
      return Response.ok('Endpoint #3');
    });

  final server = await serve(router, ip, port);
  print('Server is starting at http://${server.address.host}:${server.port}');
}
