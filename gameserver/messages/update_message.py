from messages.message import Message
import json

class UpdateMessage(Message):
    messageType = "update_message"
    gameEntities = [] # List<Dict<String,dynamic>>

    def __init__(self, gameEntities):
        # List<GameEntity> -> List<Dict<String,dynamic>> 
        self.gameEntities = []
        for entity in gameEntities:
            self.gameEntities.append(entity.convertToDict())

    def toDict(self):
        message = {
            "type": self.messageType,
            "entities": self.gameEntities
        }
        return message