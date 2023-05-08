import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {
  // final ip = InternetAddress.anyIPv4;
  final ip = "localhost";

  final int port = int.parse(Platform.environment["PORT"] ?? '8080');

  final router = Router()
    ..get('/homepage', (Request req) {
      return Response.ok('Welcome to home page');
    })
    ..get("/profile", (Request req) {
      return Response.ok(" This profile page");
    })
    ..get("/info", (Request req) {
      return Response.ok("This is info page");
    });

  final server = await serve(router, ip, port);

  print("server is running at http://${server.address.host}:${server.port}");
}