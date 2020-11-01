import messages.proto.gen.messages.proto.messages_pb2 as Proto
from entities.entity import *
class Message:
    
    @staticmethod
    def createEntitiesMessage(entities : Entity):
        protoMessage = Proto.Message()
        protoEntities = Proto.Entities()
        for e in entities:
            protoEntities.entities.append(e.toProto())

        protoMessage.entities.CopyFrom(protoEntities)
        return protoMessage