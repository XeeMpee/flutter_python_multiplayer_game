import 'dart:convert';

import 'package:flareexample/entities/entities_factory.dart';
import 'package:flareexample/entities/entity.dart';

abstract class Message {
  Map<String, dynamic> convert();
  String toJson() => json.encode(convert());

  static String composeJson(List<Message> messages) {
    List<Map<String, dynamic>> messagesMap =
        messages.map((Message message) => message.convert()).toList();
    return json.encode(messagesMap);
  }
}
