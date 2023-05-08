import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
void main(List<String> args)async {
  final ip=InternetAddress.anyIPv4;
  final port =int.parse(Platform.environment["port"]??'8080');
  final router =Router();
  ..get('/hompage',(Request req) 
{return Response.ok('hom page'));}
..get  ('homepage'.ok(Request req)
{return Response.ok('hi  '));}
..get('/homepage', (Request req))
{return Response("statusCode");}
  final  server  = await serve(router,ip,port);
print('server is at http://${server.address.host}:${server.port}');


