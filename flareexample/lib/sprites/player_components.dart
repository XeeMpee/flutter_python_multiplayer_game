import 'package:flame/components/animation_component.dart';

enum PlayerState { PLAYER_DOWN, PLAYER_LEFT, PLAYER_RIGHT, PLAYER_UP, NONE }

class PlayerComponent extends AnimationComponent {
  PlayerState state;
  PlayerComponent(double textureY, {this.state})
      : super.sequenced(
          60.0,
          60.0,
          "player.png",
          8,
          textureWidth: 60.0,
          textureHeight: 60.0,
          stepTime: 0.2,
          textureY: textureY,
          loop: true,
        );
}

class PlayerComponentFactory {
  Map<PlayerState, Function> _factories = {
    PlayerState.PLAYER_DOWN: () => PlayerComponent(
          0.0,
          state: PlayerState.PLAYER_DOWN,
        ),
    PlayerState.PLAYER_LEFT: () => PlayerComponent(
          60.0,
          state: PlayerState.PLAYER_LEFT,
        ),
    PlayerState.PLAYER_RIGHT: () => PlayerComponent(
          120.0,
          state: PlayerState.PLAYER_RIGHT,
        ),
    PlayerState.PLAYER_UP: () => PlayerComponent(
          180.0,
          state: PlayerState.PLAYER_UP,
        ),
  };

  PlayerComponent create(PlayerState state) {
    return _factories[state]();
  }
}
