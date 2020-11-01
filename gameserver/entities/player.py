from entities.entity import *
import messages.proto.gen.messages.proto.messages_pb2 as Proto

class Player(Entity):
    state = None

    def __init__(self, id, x, y, state):
        self.entityId = id
        self.x = x
        self.y = y
        self.state = state

    @staticmethod
    def createPlayer(protoEntity):
        x = protoEntity.position.x
        y = protoEntity.position.y
        entityId = protoEntity.id
        state = protoEntity.player.playerState
        player = Player(entityId,x,y,state)
        return player
    

    def toProto(self):
        protoEntity = Proto.Entity()
        protoPlayer = Proto.Player()
        protoPosition = Proto.Position()

        protoEntity.id = self.entityId
        protoPosition.x = self.x
        protoPosition.y = self.y
        protoPlayer.playerState = self.state

        protoEntity.position.CopyFrom(protoPosition) 
        protoEntity.player.CopyFrom(protoPlayer)

        return protoEntity


        