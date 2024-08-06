import 'dart:convert';

import 'package:tractian_challenge/2-app/modules/assetsPage/widgets/node_entity.dart';

class LocationModel extends NodeEntity {
  LocationModel({
    required super.id,
    required super.name,
    super.parentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'parentId': parentId,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      parentId: map['parentId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) => LocationModel.fromMap(json.decode(source));

  static List<LocationModel> fromJsonList(List<dynamic> json) =>
      json.map<LocationModel>((e) => LocationModel.fromMap(e as Map<String, dynamic>)).toList();
}
