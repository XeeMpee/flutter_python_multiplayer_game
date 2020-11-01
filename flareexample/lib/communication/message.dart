import 'package:flareexample/communication/proto/gen/lib/communication/proto/messages.pb.dart'
    as Proto;
import 'package:flareexample/entities/entity.dart';

class Message {
  static Proto.Message createEntitiesMessage(List<Entity> entities) {
    Proto.Entities protoEntitiesMessage = Proto.Entities();
    Proto.Message message = Proto.Message();
    entities.forEach((Entity entity) {
      protoEntitiesMessage.entities.add(entity.toProto());
    });
    message.entities = protoEntitiesMessage;
    return message;
  }
}
