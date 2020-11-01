import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketPlatformFactory {
  static WebSocketChannel create(String url) {
    return  IOWebSocketChannel.connect(url);
  }
}