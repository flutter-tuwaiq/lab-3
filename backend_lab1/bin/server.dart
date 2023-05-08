import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {
  final ip = InternetAddress.anyIPv4;
  // final ip = 'localhost'; => if the first line not work, use this line
  final int port = int.parse(Platform.environment['PORT'] ?? '8080');
  final router = Router()
    ..get('/homepage', (Request req) {
      return Response.ok('this is home page');
    })
    ..get('/services', (Request req) {
      return Response.ok("we have 3 services");
    }) //get(end point, handler)
    ..get('/settings', (Request req) {
      return Response.ok("you are in settings page");
    }); //get(end point, handler)
  final server = await serve(router, ip, port);

  print("server is starting at http://${server.address.host}:${server.port}");
}
