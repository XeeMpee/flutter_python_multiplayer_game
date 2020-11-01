import asyncio
import websockets
from websockets import WebSocketServerProtocol
import time
import json

from entities_manager import *
from game_entity import *

from messages.update_message import UpdateMessage

class GameCommunication:
    __entitiesManager = None
    __websockets = []

    def __init__(self, entitiesManager : EntitiesManager):
        self.__entitiesManager = entitiesManager
    
    async def notifyAll(self, message : str):
        for ws in self.__websockets:
            await ws.send(message)


    async def handler(self, websocket : WebSocketServerProtocol, path : str):
        while True:
            self.__websockets.append(websocket)
            async for msg in websocket:
                data = json.loads(msg)
                # On incomming message:
                for element in data:
                    if(element["message"] == "player_message"):
                        self.__entitiesManager.update([GameEntity.createFromDict(element)])

                # Generate outgoing message:
                await self.notifyAll(json.dumps([UpdateMessage(self.__entitiesManager.getAll()).toDict()]))
        self.__websockets.remove(websocket)
