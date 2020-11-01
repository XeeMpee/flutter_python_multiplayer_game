import asyncio
import websockets
from websockets import WebSocketServerProtocol
import time
import json
import messages.proto.gen.messages.proto.messages_pb2 as Proto
from messages.message import *

from entities_manager import *
from game_entity import *
from entities.player import *


class GameCommunication:
    __entitiesManager = None
    __websockets = []

    def __init__(self, entitiesManager : EntitiesManager):
        self.__entitiesManager = entitiesManager
    
    async def notifyAll(self, message : str):
        for ws in self.__websockets:
            await ws.send(message.SerializeToString())


    async def handler(self, websocket : WebSocketServerProtocol, path : str):
        while True:
            self.__websockets.append(websocket)
            async for msg in websocket:
                protoMessage = Proto.Message()
                protoMessage.ParseFromString(msg)

                # Handling enitites message
                if protoMessage.HasField('entities'):
                    self.__handleEntitiesMessage(protoMessage)

                # Generate outgoing message:
                await self.notifyAll(Message.createEntitiesMessage(self.__entitiesManager.getAll()))
        self.__websockets.remove(websocket)
    

    # ---------- Handle messages -----------
    def __handleEntitiesMessage(self, protoMessage):
        protoEntities = protoMessage.entities.entities
        entities = []
        for protoEntity in protoEntities:

            # Recognizing entities:
            if(protoEntity.HasField('player')):
                entity = Player.createPlayer(protoEntity)
                entities.append(entity)

        # updating manager:
        self.__entitiesManager.update(entities)
