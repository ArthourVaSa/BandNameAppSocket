// ignore_for_file: constant_identifier_names, unnecessary_this, unused_field, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  Online,
  Offline,
  Connecting,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;

  SocketService() {
    this._initConfig();
  }

  get serverStatus => this._serverStatus;

  void _initConfig() {
    IO.Socket socket = IO.io('http://192.168.114.100:3000', {
      'transports': ['websocket'],
      'autoConnect': true,
    });
    socket.onConnect((_) {
      print('connect');
      this._serverStatus = ServerStatus.Online;
      socket.emit('msg', 'test');
      notifyListeners();
    });
    socket.onDisconnect((_) {
      this._serverStatus = ServerStatus.Online;
      socket.emit('msg', 'test');
      notifyListeners();
    });
  }
}
