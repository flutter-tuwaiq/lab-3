// import 'dart:io';

// import 'package:shelf/shelf.dart';
// import 'package:shelf/shelf_io.dart';
// import 'package:shelf_router/shelf_router.dart';

// Configure routes.
// final _router = Router()
//   ..get('/', _rootHandler)
//   ..get('/echo/<message>', _echoHandler);

// Response _rootHandler(Request req) {
//   return Response.ok('Hello, World!\n');
// }

// Response _echoHandler(Request request) {
//   final message = request.params['message'];
//   return Response.ok('$message\n');
// }

// void main(List<String> args) async {
//   // Use any available host or container IP (usually `0.0.0.0`).
//   final ip = InternetAddress.anyIPv4;

//   // Configure a pipeline that logs requests.
//   final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

//   // For running in containers, we respect the PORT environment variable.
//   final port = int.parse(Platform.environment['PORT'] ?? '8080');
//   final server = await serve(handler, ip, port);
//   print('Server listening on port ${server.port}');
// }
import 'dart:io';

//import 'package:http/http.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args)async {
//var ip for my divaice 
  final ip = InternetAddress.anyIPv4;
  //   or     final ip ="localhost";


   // port var 
final int port = int.parse(Platform.environment["PORT"] ?? "8080");

// توجيه و عمليات الهانلدر وكت الريك
final router = Router()
..get("/homepage", (Request req){
return Response.ok('haifa alshareef ');
})

..get("/setting", (Request req){
return Response.ok('setting  ');
})

..get("/page", (Request req){
return Response.ok('page1 ');
}); 

 
 


//serv to run the server 
final server = await serve(router, ip, port);


//check if serer is turn on 
print("server is on at http://${server.address.host}:${server.port}");

//http://0.0.0.0:8080/homepage


}