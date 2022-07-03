import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MapModel {
  String? name;
  String? rfId;
  int? price;
  Timestamp? time;
  int? setName;
  bool? status;
  String? id;
  MapModel({
    this.name,
    this.rfId,
    this.price,
    this.time,
    this.setName,
    this.status,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'rfId': rfId,
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
      rfId: map['rfId'],
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

  MapModel copyWith({
    String? name,
    String? rfId,
    int? price,
    Timestamp? time,
    int? setName,
    bool? status,
    String? id,
  }) {
    return MapModel(
      name: name ?? this.name,
      rfId: rfId ?? this.rfId,
      price: price ?? this.price,
      time: time ?? this.time,
      setName: setName ?? this.setName,
      status: status ?? this.status,
      id: id ?? this.id,
    );
  }
}
