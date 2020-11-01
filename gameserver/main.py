#!/usr/bin/env python

import asyncio
import websockets
from entities_manager import EntitiesManager
from  game_communication import GameCommunication

entitiesManager = EntitiesManager()
gameCommunication = GameCommunication(entitiesManager)

start_server = websockets.serve(gameCommunication.handler, "192.168.0.206", 8765)
loop = asyncio.get_event_loop()
loop.run_until_complete(start_server)
loop.run_forever()