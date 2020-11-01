import 'package:flame/components/component.dart';
import 'package:flareexample/entities/entity.dart';
import 'package:flareexample/sprites/player_components.dart';

class Player implements Entity {
  static String entityType = "Player";
  PlayerComponent playerComponent;
  PlayerComponentFactory componentFactory = PlayerComponentFactory();

  String playerId = "player:unknown";
  double xPos = 0.0;
  double yPos = 0.0;
  PlayerState state = PlayerState.PLAYER_DOWN;

  Player({this.playerId, double x = 0.0, double y = 0.0, PlayerState playerState=PlayerState.PLAYER_DOWN}) {
    playerComponent = componentFactory.create(playerState);
    this.x = x;
    this.y = y;
  }

  void switchComponent() {
    if (playerComponent.state == null) {
      playerComponent = componentFactory.create(PlayerState.PLAYER_DOWN);
    } else if (playerComponent.state == PlayerState.PLAYER_DOWN) {
      playerComponent = componentFactory.create(PlayerState.PLAYER_LEFT);
    } else if (playerComponent.state == PlayerState.PLAYER_LEFT) {
      playerComponent = componentFactory.create(PlayerState.PLAYER_RIGHT);
    } else if (playerComponent.state == PlayerState.PLAYER_RIGHT) {
      playerComponent = componentFactory.create(PlayerState.PLAYER_UP);
    } else if (playerComponent.state == PlayerState.PLAYER_UP) {
      playerComponent = componentFactory.create(PlayerState.PLAYER_DOWN);
    }
  }

  @override
  String get id => playerId;

  @override
  double get x => xPos;

  @override
  double get y => yPos;

  @override
  String get type => entityType;

  @override
  Component get component => playerComponent;

  
  set x(double x) {
    xPos = x;
    playerComponent.x = x;
  }

  set y(double y) {
    yPos = y;
    playerComponent.y = y;
  }
}
