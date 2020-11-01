import 'package:flareexample/entities/entity.dart';
import 'package:flareexample/entities/player.dart';

class EntitiesFactory {
  Map<String, Entity Function(Map<String, dynamic>)> __factories = {};

  EntitiesFactory() {
    __factories[Player.entityType] = (Map<String, dynamic> data) {
      return Player(playerId: data["id"], x: data["x"], y: data["y"]);
    };
  }

  Entity create(Map<String, dynamic> data) {
    return __factories[data["type"]](data);
  }
}
