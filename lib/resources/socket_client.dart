import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:flutter_dotenv/flutter_dotenv.dart';


class SocketClient {

 
  final ip = dotenv.env["IP"];

  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal(){
    socket = IO.io("http://$ip:3000", <String, dynamic>{
      'transports': ['websockets'],
      'autoConnect': false
    });
    socket!.connect();
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }

}