import 'dart:convert';

class UserModel {
  String? name;
  String? email;
  String? pass;
  String? phone;
  String? id;
  String? balance;
  String? time;
  int? count;
  UserModel({
    this.name,
    this.email,
    this.pass,
    this.phone,
    this.id,
    this.balance,
    this.time,
    this.count,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'pass': pass,
      'phone': phone,
      'id': id,
      'balance': balance,
      'time': time,
      'count': count,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      pass: map['pass'],
      phone: map['phone'],
      id: map['id'],
      balance: map['balance'],
      time: map['time'],
      count: map['count']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  UserModel copyWith({
    String? name,
    String? email,
    String? pass,
    String? phone,
    String? id,
    String? balance,
    String? time,
    int? count,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      pass: pass ?? this.pass,
      phone: phone ?? this.phone,
      id: id ?? this.id,
      balance: balance ?? this.balance,
      time: time ?? this.time,
      count: count ?? this.count,
    );
  }
}
