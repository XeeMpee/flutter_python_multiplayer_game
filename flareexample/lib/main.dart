import 'dart:io';

import 'package:flame/game.dart';
import 'package:flame/util.dart';
import 'package:flareexample/communication/remote_game_server.dart';
import 'package:flareexample/game/entities_manager.dart';
import 'package:flareexample/game/game_logic.dart';
import 'package:flareexample/gui/screens/auth_screen.dart';
import 'package:flareexample/gui/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flareexample/tools/websocket_channel_factory/websocket_channel_factory.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  // Setting websocket channel:
  final String channelUrl = "ws://192.168.0.206:8765/";
  WebSocketChannel channel = WebSocketFactory.create(channelUrl);

  EntitiesManager entitiesManager = EntitiesManager();
  RemoteGameServer remoteGameServer = RemoteGameServer(
    wsChannel: channel,
    entitiesManager: entitiesManager,
  );
  Game game = GameLogic(
    remoteGameServer: remoteGameServer,
    entitiesManager: entitiesManager,
  );

  // Running flutter app:
  runApp(GameApp(
    game: game,
    socketChannel: channel,
  ));
}

class GameApp extends StatelessWidget {
  final GameLogic game;
  final WebSocketChannel socketChannel;
  GameApp({Key key, this.game, this.socketChannel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (ctx) => AuthScreen(),
        AuthScreen.routeName: (ctx) => AuthScreen(),
        GameScreen.routeName: (ctx) => GameScreen(game: game),
      },
    );
  }
}
