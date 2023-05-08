
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';


void main(List<String> args) async {
  
  
  final ip = "localhost";             
  final port = int.parse(Platform.environment["PORT"] ?? '8080');
  final router =  Router()
  ..get("/Home", (Request request){
      return Response.ok('Home');
  })
  ..get('/About', (Request request){
      return Response.ok('About');
  })
  ..get('/Contact', (Request request){
      return Response.ok('Contact');
  });
  final server = await serve(router, ip, port);

  print("Server is Http:/${server.address.host}:${server.port}");

}

