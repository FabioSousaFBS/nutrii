// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:nutrii/core/entities/food_entity.dart';

class Meal extends Equatable {
  int id;
  String name;
  String hour;
  List<Food> foods;
  List<Food> optionsFoods;

  Meal({
    required this.id,
    required this.name,
    required this.hour,
    required this.foods,
    required this.optionsFoods,
  });

  factory Meal.empty() => Meal(
        id: -1,
        name: "",
        hour: "",
        foods: const [],
        optionsFoods: const [],
      );

  Meal copyWith({
    int? id,
    String? name,
    String? hour,
    List<Food>? foods,
    List<Food>? optionsFoods,
  }) {
    return Meal(
      id: id ?? this.id,
      name: name ?? this.name,
      hour: hour ?? this.hour,
      foods: foods ?? this.foods,
      optionsFoods: optionsFoods ?? this.optionsFoods,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      hour,
      foods,
      optionsFoods,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'hour': hour,
      'foods': foods.map((x) => x.toMap()).toList(),
      'optionsFoods': optionsFoods.map((x) => x.toMap()).toList(),
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'] as int,
      name: map['name'] as String,
      hour: map['hour'] as String,
      foods: List<Food>.from((map['foods'] as List<int>).map<Food>((x) => Food.fromMap(x as Map<String,dynamic>),),),
      optionsFoods: List<Food>.from((map['optionsFoods'] as List<int>).map<Food>((x) => Food.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) => Meal.fromMap(json.decode(source) as Map<String, dynamic>);
}
