import 'package:flame/game.dart';
import 'package:flareexample/communication/message.dart';
import 'package:flareexample/communication/remote_game_server.dart';
import 'package:flareexample/entities/player.dart';
import 'package:flareexample/game/entities_manager.dart';

class GameLogic extends BaseGame {
  final RemoteGameServer remoteGameServer;
  EntitiesManager entitiesManager;
  String __playerId;

  GameLogic({this.remoteGameServer, this.entitiesManager}) {
    entitiesManager.setGameLogic(this);
  }

  void initPlayerEntity({Player initPlayer}) {
    entitiesManager.update([initPlayer]);
    __playerId = initPlayer.id;
    Player player = entitiesManager.getEntity(__playerId);
    add(player.playerComponent);
    remoteGameServer.send(Message.createEntitiesMessage([player]));
  }

  swithPlayerDirection() {
    Player player = entitiesManager.getEntity(__playerId);
    double x = player.playerComponent.x;
    double y = player.playerComponent.y;
    markToRemove(player.playerComponent);
    player.switchComponent();
    player.playerComponent.x = x;
    player.playerComponent.y = y;
    player.playerComponent.angle = 0;
    add(player.playerComponent);
  }

  movePlayer(double dx, double dy) {
    Player player = entitiesManager.getEntity(__playerId);
    double x = player.playerComponent.x;
    double y = player.playerComponent.y;
    markToRemove(player.playerComponent);
    player.x = x + dx;
    player.y = y + dy;
    player.playerComponent.angle = 0;
    add(player.playerComponent);
    remoteGameServer.send(Message.createEntitiesMessage([player]));
  }
}
