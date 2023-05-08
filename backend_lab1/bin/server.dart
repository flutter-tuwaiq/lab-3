import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {

  final ip = InternetAddress.anyIPv4;
  final int port = int.parse(Platform.environment['PORT'] ?? '8080');
final router = Router()..get('/morning', (Request req){
  return Response.ok("Good Morning");
})..get('/afternoon', (Request req){
  return Response.ok("Good afternoon");
})..get('/evening', (Request req){
  return Response.ok("Good afternoon");
});
  // For running in containers, we respect the PORT environment variable.
  final server = await serve(router, ip, port);
  print('Server is starting at port http://${server.address.host}:${server.port}');

}
