import 'package:flareexample/entities/entity.dart';
import 'package:flareexample/game/game_logic.dart';

class EntityNotFound implements Exception {
  final String message;
  EntityNotFound([String message = ""]) : message = message;
  String what() {
    return message != null ? message : "";
  }
}

class EntitiesManager {
  List<Entity> __entities = [];
  GameLogic game;

  void setGameLogic(GameLogic gameLogic) {
    game = gameLogic;
  }

  void update(List<Entity> entities) {
    game.components.clear();
    for (Entity entity in entities) {
      int indexOfExistingEntity = __entities
          .indexWhere((Entity testedEntity) => testedEntity.id == entity.id);
      if (indexOfExistingEntity == -1) {
        __entities.add(entity);
        print("Entity added:\n ${entity.toString()}");
      } else {
        __entities[indexOfExistingEntity] = entity;
        print("Entity updated:\n ${entity.toString()}");
      }
      game.components.add(entity.component);
    }
  }

  Entity getEntity(String id) {
    return __entities.firstWhere(
      (Entity entity) => entity.id == id,
      orElse: () => null,
    );
  }

  List<Entity> getAll() {
    return __entities;
  }

  void remove(String id) {
    __entities.removeWhere((Entity entity) => entity.id == id);
  }
}
