import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MapModel {
  String? name;
  int? price;
  Timestamp? time;
  int? setName;
  bool? status;
  String? id;
  MapModel({
    this.name,
    this.price,
    this.time,
    this.setName,
    this.status,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'time': time,
      'set Name': setName,
      'status': status,
      'id': id,
    };
  }

  factory MapModel.fromMap(Map<String, dynamic> map) {
    return MapModel(
      name: map['name'],
      price: map['price'],
      time: map['time'],
      setName: map['set Name'],
      status: map['status'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MapModel.fromJson(String source) =>
      MapModel.fromMap(json.decode(source));
}
