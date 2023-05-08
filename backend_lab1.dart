import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
void main(List<String> args) async {
  //final ip =InternetAddress.anyIPv4;
  final ip ="localhost";//في حال م اشتغل الايب فور

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final router =Router() 
  ..get('/endpoint1', (Request req){
    return Response.ok('backend1');
    
  });
  final router2 =Router() 
  ..get('/endpoint2', (Request req){
    return Response.ok('backend2');
    
  });
  final router3 =Router() 
  ..get('/endpoint2', (Request req){
    return Response.ok('backend3');
    
  });
  final Server = await serve(router, ip, port);
  print("server is dtarting at http://${Server.address.host}:${Server.port}");
}