import 'package:flutter_test/flutter_test.dart';
import 'package:flareexample/entities/entity.dart';
import 'package:flareexample/entities/player.dart';
import 'package:flareexample/game/entities_manager.dart';

void main() {
  test('EntitiesMnager update tests', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    EntitiesManager manager = EntitiesManager();
    List<Entity> entities = [
      Player.create(playerId: "Player1"),
      Player.create(playerId: "Player2"),
      Player.create(playerId: "Player3"),
      Player.create(playerId: "Player4"),
    ];

    manager.update(entities);

    List<Entity> getEntites = manager.getAll();
    expect(getEntites, entities);
  });

  test('EntitiesMnager update tests', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    EntitiesManager manager = EntitiesManager();
    Player player1 = Player.create(playerId: "Player1");
    Player player2 = Player.create(playerId: "Player2");
    Player player3 = Player.create(playerId: "Player3");
    Player player4 = Player.create(playerId: "Player4");
    List<Entity> entities = [player1, player2, player3, player4];
    manager.update(entities);

    expect(manager.getAll(), entities);
    manager.getAll().forEach((Entity entity) { 
      expect(entity.x, 0.0);
      expect(entity.y, 0.0);
    });

    manager.update([Player.create(playerId: "Player3", x: 20.0, y: 30.0)]);
    expect(manager.getAll()[2].x, 20.0);
    expect(manager.getAll()[2].y, 30.0);
  });

   test('Removing from manager', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    EntitiesManager manager = EntitiesManager();
    Player player1 = Player.create(playerId: "Player1");
    Player player2 = Player.create(playerId: "Player2");
    Player player3 = Player.create(playerId: "Player3");
    Player player4 = Player.create(playerId: "Player4");
    List<Entity> entities = [player1, player2, player3, player4];
    manager.update(entities);

    expect(manager.getAll(), entities);
    manager.getAll().forEach((Entity entity) { 
      expect(entity.x, 0.0);
      expect(entity.y, 0.0);
    });

    manager.remove("Player3");
    expect(manager.getAll()[2].x, 20.0);
    expect(manager.getAll()[2].y, 30.0);
  });
}
