import 'package:flareexample/communication/proto/gen/lib/communication/proto/messages.pb.dart'
    as Proto;
import 'package:flareexample/entities/player.dart';
import 'package:flareexample/game/entities_manager.dart';
import 'package:meta/meta.dart';

import 'package:flareexample/entities/entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RemoteGameServer {
  WebSocketChannel wsChannel;
  EntitiesManager entitiesManager;

  Map<Type, Function> __handlers = Map<Type, Function>();

  RemoteGameServer({@required this.wsChannel, @required this.entitiesManager}) {
    wsChannel.stream.listen(__onMessage);

    // Message handlers:
    __handlers[Proto.Entities] = __onEntitiesMessage;
    // __handlers["message_tag"] = __onMessageHandler;
    // __handlers["message_tag"] = __onMessageHandler;
    // __handlers["message_tag"] = __onMessageHandler;
    // ...
  }

  void send(Proto.Message message) {
    wsChannel.sink.add(message);
  }

  get sink => wsChannel.sink;
  get stream => wsChannel.stream;

  // ---------------------------------------

  void __onMessage(dynamic message) {
    // message is <Proto.Message> 
    print("Messages received: $message");
    if (message.hasEntities()) {
      __handlers[Proto.Entities](message.entities);
    } else {
      // Add new messages...
    }
  }

  // ----------- handlelrs ---------------
  __onEntitiesMessage(Proto.Entities protoEntities) {
    List<Entity> entities = [];
    for (Proto.Entity entity in protoEntities.entities) {
      if (entity.hasPlayer()) {
        entities.add(Player.fromProto(entity));
      }
    }
  }
}
