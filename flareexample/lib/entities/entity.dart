
import 'package:flame/components/component.dart';

abstract class Entity {
  String get type;
  String get id;
  double get x;
  double get y;
  Component get component;
  
  @override
  String toString() {
    return 'Entity: "$id" [x: $x; y:$y] ';
  }
}
