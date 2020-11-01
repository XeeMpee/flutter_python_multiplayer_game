import 'package:meta/meta.dart';

import 'package:flareexample/communication/message.dart';
import 'package:flareexample/entities/player.dart';

class PlayerMessage extends Message {
  static String message = "player_message";
  Player player;
  PlayerMessage({@required this.player});

  @override
  Map<String, dynamic> convert() {
    return {
      "message": message,
      "type" : player.type,
      "id": player.playerId,
      "x": player.x,
      "y": player.y,
    };
  }
}
