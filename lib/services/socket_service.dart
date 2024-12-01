// lib/services/socket_service.dart
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  IO.Socket? socket;

  void connect() {
    socket = IO.io('http://192.168.1.12:3000', <String, dynamic>{
      'transports': ['websocket'],
    });

    socket?.on('connect', (_) {
      print('Connected to server');
    });
  }

  void sendMove(int index, String player) {
    socket?.emit('playerMove', {'index': index, 'player': player});
  }

  void onMoveReceived(Function(int, String) callback) {
    socket?.on('move', (data) {
      callback(data['index'], data['player']);
    });
  }
}
