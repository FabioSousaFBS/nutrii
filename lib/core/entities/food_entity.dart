// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Food extends Equatable {
  int id;
  String name;
  
  Food({
    required this.id,
    required this.name,
  });

  factory Food.empty() => Food(
        id: -1,
        name: "",
      );

  Food copyWith({
    int? id,
    String? name,
  }) {
    return Food(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  } 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source) as Map<String, dynamic>);

   @override
  List<Object> get props => [id, name];
}
