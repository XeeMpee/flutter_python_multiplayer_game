import 'package:flame/components/component.dart';
import 'package:flareexample/communication/proto/gen/lib/communication/proto/messages.pb.dart'
    as Proto;
import 'package:flareexample/entities/entity.dart';
import 'package:flareexample/sprites/player_components.dart';

class Player implements Entity {
  PlayerComponent playerComponent;
  PlayerComponentFactory componentFactory = PlayerComponentFactory();

  String playerId = "player:unknown";
  double xPos = 0.0;
  double yPos = 0.0;
  PlayerState state = PlayerState.PLAYER_DOWN;

  // --------- default factory -----------
  Player.create(
      {this.playerId,
      double x = 0.0,
      double y = 0.0,
      PlayerState playerState = PlayerState.PLAYER_DOWN}) {
    playerComponent = componentFactory.create(playerState);
    this.x = x;
    this.y = y;
  }

  // --------- proto factory -----------
  Player.fromProto(Proto.Entity protoEntity)
      : this.create(
            playerId: protoEntity.id,
            x: protoEntity.position.x,
            y: protoEntity.position.y,
            playerState: __convertToPlayerStateFromProto(
                protoEntity.player.playerState));

  // public methods:
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

  // getters and setteres:
  @override
  String get id => playerId;

  @override
  double get x => xPos;

  @override
  double get y => yPos;

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


  // conversions proto:
  @override
  Proto.Entity toProto(){
    Proto.Position protoPosition = Proto.Position();
    protoPosition.x = x;
    protoPosition.y = y;

    Proto.Player protoPlayer = Proto.Player();
    protoPlayer.playerState = __convertToProtoFromPlayerState(state);

    Proto.Entity protoEntity = Proto.Entity();
    protoEntity.id = playerId;
    protoEntity.position = protoPosition;
    protoEntity.player = protoPlayer;

    return protoEntity;
  }

  static PlayerState __convertToPlayerStateFromProto(
      Proto.Player_PlayerState state) {
    Proto.Player_PlayerState protoState = state;
    if (protoState == Proto.Player_PlayerState.MOVE_DOWN) {
      return PlayerState.PLAYER_DOWN;
    } else if (protoState == Proto.Player_PlayerState.MOVE_UP) {
      return PlayerState.PLAYER_UP;
    } else if (protoState == Proto.Player_PlayerState.MOVE_LEFT) {
      return PlayerState.PLAYER_LEFT;
    } else {
      return PlayerState.NONE;
    }
  }

  static Proto.Player_PlayerState __convertToProtoFromPlayerState(
      PlayerState state) {
    if (state == PlayerState.PLAYER_DOWN) {
      return Proto.Player_PlayerState.MOVE_DOWN;
    } else if (state == PlayerState.PLAYER_UP) {
      return Proto.Player_PlayerState.MOVE_UP;
    } else if (state == PlayerState.PLAYER_LEFT) {
      return Proto.Player_PlayerState.MOVE_LEFT;
    } else {
      return null;
    }
  }
}
