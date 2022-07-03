import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryModel {
  Timestamp? startTime;
  String? rfId;

  String? time;
  Timestamp? endTime;
  String? price;
  int? setName;
  String? setPrice;
  HistoryModel({
    this.startTime,
    this.rfId,
    this.time,
    this.endTime,
    this.price,
    this.setName,
    this.setPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'startTime': startTime,
      'rfId': rfId,
      'time': time,
      'endTime': endTime,
      'price': price,
      'setName': setName,
      'setPrice': setPrice,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      startTime: map['startTime'],
      rfId: map['rfId'],
      time: map['time'],
      endTime: map['endTime'],
      price: map['price'],
      setName: map['setName']?.toInt(),
      setPrice: map['setPrice'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryModel.fromJson(String source) =>
      HistoryModel.fromMap(json.decode(source));
}
