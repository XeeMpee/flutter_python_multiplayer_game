# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: messages/proto/messages.proto

from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='messages/proto/messages.proto',
  package='',
  syntax='proto3',
  serialized_options=None,
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n\x1dmessages/proto/messages.proto\"3\n\x07Message\x12\x1d\n\x08\x65ntities\x18\x01 \x01(\x0b\x32\t.EntitiesH\x00\x42\t\n\x07paylaod\"%\n\x08\x45ntities\x12\x19\n\x08\x65ntities\x18\x01 \x03(\x0b\x32\x07.Entity\"m\n\x06\x45ntity\x12\n\n\x02id\x18\x01 \x01(\t\x12\x1b\n\x08position\x18\x02 \x01(\x0b\x32\t.Position\x12\x19\n\x06player\x18\x03 \x01(\x0b\x32\x07.PlayerH\x00\x12\x15\n\x04wall\x18\x04 \x01(\x0b\x32\x05.WallH\x00\x42\x08\n\x06\x65ntity\"|\n\x06Player\x12(\n\x0bplayerState\x18\x01 \x01(\x0e\x32\x13.Player.PlayerState\"H\n\x0bPlayerState\x12\x0b\n\x07MOVE_UP\x10\x00\x12\r\n\tMOVE_LEFT\x10\x01\x12\x0e\n\nMOVE_RIGHT\x10\x02\x12\r\n\tMOVE_DOWN\x10\x03\"\x06\n\x04Wall\" \n\x08Position\x12\t\n\x01x\x18\x01 \x01(\x01\x12\t\n\x01y\x18\x02 \x01(\x01\x62\x06proto3'
)



_PLAYER_PLAYERSTATE = _descriptor.EnumDescriptor(
  name='PlayerState',
  full_name='Player.PlayerState',
  filename=None,
  file=DESCRIPTOR,
  create_key=_descriptor._internal_create_key,
  values=[
    _descriptor.EnumValueDescriptor(
      name='MOVE_UP', index=0, number=0,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='MOVE_LEFT', index=1, number=1,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='MOVE_RIGHT', index=2, number=2,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='MOVE_DOWN', index=3, number=3,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=288,
  serialized_end=360,
)
_sym_db.RegisterEnumDescriptor(_PLAYER_PLAYERSTATE)


_MESSAGE = _descriptor.Descriptor(
  name='Message',
  full_name='Message',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='entities', full_name='Message.entities', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
    _descriptor.OneofDescriptor(
      name='paylaod', full_name='Message.paylaod',
      index=0, containing_type=None,
      create_key=_descriptor._internal_create_key,
    fields=[]),
  ],
  serialized_start=33,
  serialized_end=84,
)


_ENTITIES = _descriptor.Descriptor(
  name='Entities',
  full_name='Entities',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='entities', full_name='Entities.entities', index=0,
      number=1, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=86,
  serialized_end=123,
)


_ENTITY = _descriptor.Descriptor(
  name='Entity',
  full_name='Entity',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='id', full_name='Entity.id', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='position', full_name='Entity.position', index=1,
      number=2, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='player', full_name='Entity.player', index=2,
      number=3, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='wall', full_name='Entity.wall', index=3,
      number=4, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
    _descriptor.OneofDescriptor(
      name='entity', full_name='Entity.entity',
      index=0, containing_type=None,
      create_key=_descriptor._internal_create_key,
    fields=[]),
  ],
  serialized_start=125,
  serialized_end=234,
)


_PLAYER = _descriptor.Descriptor(
  name='Player',
  full_name='Player',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='playerState', full_name='Player.playerState', index=0,
      number=1, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
    _PLAYER_PLAYERSTATE,
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=236,
  serialized_end=360,
)


_WALL = _descriptor.Descriptor(
  name='Wall',
  full_name='Wall',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=362,
  serialized_end=368,
)


_POSITION = _descriptor.Descriptor(
  name='Position',
  full_name='Position',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='x', full_name='Position.x', index=0,
      number=1, type=1, cpp_type=5, label=1,
      has_default_value=False, default_value=float(0),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='y', full_name='Position.y', index=1,
      number=2, type=1, cpp_type=5, label=1,
      has_default_value=False, default_value=float(0),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=370,
  serialized_end=402,
)

_MESSAGE.fields_by_name['entities'].message_type = _ENTITIES
_MESSAGE.oneofs_by_name['paylaod'].fields.append(
  _MESSAGE.fields_by_name['entities'])
_MESSAGE.fields_by_name['entities'].containing_oneof = _MESSAGE.oneofs_by_name['paylaod']
_ENTITIES.fields_by_name['entities'].message_type = _ENTITY
_ENTITY.fields_by_name['position'].message_type = _POSITION
_ENTITY.fields_by_name['player'].message_type = _PLAYER
_ENTITY.fields_by_name['wall'].message_type = _WALL
_ENTITY.oneofs_by_name['entity'].fields.append(
  _ENTITY.fields_by_name['player'])
_ENTITY.fields_by_name['player'].containing_oneof = _ENTITY.oneofs_by_name['entity']
_ENTITY.oneofs_by_name['entity'].fields.append(
  _ENTITY.fields_by_name['wall'])
_ENTITY.fields_by_name['wall'].containing_oneof = _ENTITY.oneofs_by_name['entity']
_PLAYER.fields_by_name['playerState'].enum_type = _PLAYER_PLAYERSTATE
_PLAYER_PLAYERSTATE.containing_type = _PLAYER
DESCRIPTOR.message_types_by_name['Message'] = _MESSAGE
DESCRIPTOR.message_types_by_name['Entities'] = _ENTITIES
DESCRIPTOR.message_types_by_name['Entity'] = _ENTITY
DESCRIPTOR.message_types_by_name['Player'] = _PLAYER
DESCRIPTOR.message_types_by_name['Wall'] = _WALL
DESCRIPTOR.message_types_by_name['Position'] = _POSITION
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

Message = _reflection.GeneratedProtocolMessageType('Message', (_message.Message,), {
  'DESCRIPTOR' : _MESSAGE,
  '__module__' : 'messages.proto.messages_pb2'
  # @@protoc_insertion_point(class_scope:Message)
  })
_sym_db.RegisterMessage(Message)

Entities = _reflection.GeneratedProtocolMessageType('Entities', (_message.Message,), {
  'DESCRIPTOR' : _ENTITIES,
  '__module__' : 'messages.proto.messages_pb2'
  # @@protoc_insertion_point(class_scope:Entities)
  })
_sym_db.RegisterMessage(Entities)

Entity = _reflection.GeneratedProtocolMessageType('Entity', (_message.Message,), {
  'DESCRIPTOR' : _ENTITY,
  '__module__' : 'messages.proto.messages_pb2'
  # @@protoc_insertion_point(class_scope:Entity)
  })
_sym_db.RegisterMessage(Entity)

Player = _reflection.GeneratedProtocolMessageType('Player', (_message.Message,), {
  'DESCRIPTOR' : _PLAYER,
  '__module__' : 'messages.proto.messages_pb2'
  # @@protoc_insertion_point(class_scope:Player)
  })
_sym_db.RegisterMessage(Player)

Wall = _reflection.GeneratedProtocolMessageType('Wall', (_message.Message,), {
  'DESCRIPTOR' : _WALL,
  '__module__' : 'messages.proto.messages_pb2'
  # @@protoc_insertion_point(class_scope:Wall)
  })
_sym_db.RegisterMessage(Wall)

Position = _reflection.GeneratedProtocolMessageType('Position', (_message.Message,), {
  'DESCRIPTOR' : _POSITION,
  '__module__' : 'messages.proto.messages_pb2'
  # @@protoc_insertion_point(class_scope:Position)
  })
_sym_db.RegisterMessage(Position)


# @@protoc_insertion_point(module_scope)
