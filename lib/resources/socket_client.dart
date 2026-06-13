import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:flutter_dotenv/flutter_dotenv.dart';


class SocketClient {

 
  final ip = dotenv.env["IP"];

  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal(){
    socket = IO.io("http://127.0.0.1:3000", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false
    });
    socket!.onConnect((_) {
      print("Socket connected!");
    });
    socket!.onDisconnect((_) {
      print("Socket disconnected!");
    });
    socket!.onError((error) {
      print("Socket error: $error");
    });
    socket!.connect();
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }

}