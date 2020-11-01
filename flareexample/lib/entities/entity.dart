
import 'package:flame/components/component.dart';
import 'package:flareexample/communication/proto/gen/lib/communication/proto/messages.pb.dart' as Proto;

abstract class Entity {
  String get id;
  double get x;
  double get y;
  Component get component;

  Proto.Entity toProto();
  
  @override
  String toString() {
    return 'Entity: "$id" [x: $x; y:$y] ';
  }
}
