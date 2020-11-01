import 'dart:convert';
import 'package:flareexample/communication/message.dart';
import 'package:flareexample/game/entities_manager.dart';
import 'package:meta/meta.dart';

import 'package:flareexample/entities/entities_factory.dart';
import 'package:flareexample/entities/entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RemoteGameServer {
  WebSocketChannel wsChannel;
  EntitiesManager entitiesManager;
  EntitiesFactory entitiesFactory = new EntitiesFactory();

  Map<String, Function> __handlers = Map<String, Function>();

  RemoteGameServer({@required this.wsChannel, @required this.entitiesManager}) {
    wsChannel.stream.listen(__onMessage);

    // Message handlers:
    __handlers["update_message"] = __onEntitiesUpdateMessage;
    // __handlers["message_tag"] = __onMessageHandler;
    // __handlers["message_tag"] = __onMessageHandler;
    // __handlers["message_tag"] = __onMessageHandler;
    // ...
  }

  void send(List<Message> messages) {
    wsChannel.sink.add(Message.composeJson(messages));
  }

  get sink => wsChannel.sink;
  get stream => wsChannel.stream;

  // ---------------------------------------

  void __onMessage(dynamic messages) {
    print("Messages received: $messages");
    dynamic decoded = json.decode(messages);
    dynamic messagesList = decoded;
    for (Map<String, dynamic> messagesRawData in messagesList) {
      String type = messagesRawData["type"];
      __handlers[type](messagesRawData);
    }
  }

  __onEntitiesUpdateMessage(Map<String, dynamic> data) {
    List<Entity> entities = [];
    for (Map<String, dynamic> entityRawData in data["entities"]) {
      entities.add(entitiesFactory.create(entityRawData));
    }
    entitiesManager.update(entities);
  }
}
