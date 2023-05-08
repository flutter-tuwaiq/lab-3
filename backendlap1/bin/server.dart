import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args)async {
  final ip =InternetAddress.anyIPv4; 

 final port = int.parse(Platform.environment["PORT"] ?? "8080"); 


 final router = Router()..post('/homepage', (Request req){ 
 return Response.ok('home page');
 })..get('/dartpage', (Request req){ 
 return Response.ok('dart page');
 })..get('/comments', (Request req){ 
 return Response.ok('comments');
 });

 final server =await serve(router, ip, port);

 print("server is starting at http:${server.address.host}:${server.port}");
}