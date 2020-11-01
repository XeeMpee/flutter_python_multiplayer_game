import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flareexample/tools/websocket_channel_factory/websocket_channel_mobile_factory.dart'
    if (dart.library.html) 'package:flareexample/tools/websocket_channel_factory/websocket_channel_html_factory.dart';

class WebSocketFactory {
  static WebSocketChannel create(String url) {
    return WebSocketPlatformFactory.create(url);
  }
}
