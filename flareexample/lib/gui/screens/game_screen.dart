import 'package:flareexample/entities/player.dart';
import 'package:flareexample/game/game_logic.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class GameScreenArguments {
  final String playerName;
  GameScreenArguments({@required this.playerName});
}

class GameScreen extends StatelessWidget {
  static String routeName = "GameScren";
  final GameLogic game;
  String __playerName;

  GameScreen({Key key, @required this.game})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using route args:
    if (__playerName == null) {
      onGameStarted(context);
    }

    // Builing widget:
    return Scaffold(
        body: game.widget,
        floatingActionButton: Container(
          width: 100,
          height: 100,
          child: GridView.count(
            crossAxisCount: 3,
            padding: EdgeInsets.all(0.0),
            children: [
              Container(),
              RaisedButton(
                  onPressed: () => game.movePlayer(0, -10)), // Up buton
              Container(),
              RaisedButton(
                  onPressed: () => game.movePlayer(-10, 0)), // Left buton
              FloatingActionButton(
                  onPressed: () => game.swithPlayerDirection()),
              RaisedButton(
                  onPressed: () => game.movePlayer(10, 0)), // Right buton
              Container(),
              RaisedButton(
                  onPressed: () => game.movePlayer(0, 10)), // Down buton
              Container(),
            ],
          ),
        ));
  }

  // -----------------------------------------------------------------------------------------

  void onGameStarted(BuildContext context) {
    GameScreenArguments args = ModalRoute.of(context).settings.arguments;
    __playerName = args.playerName;
    game.initPlayerEntity(initPlayer: Player.create(playerId: __playerName, x:0.0, y:0.0));
    // game.player.playerId = __playerName;
    // game.socketChannel.sink
        // .add(Message.composeJson([PlayerMessage(player: game.player)]));
  }
}
