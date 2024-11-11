// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:nutrii/core/entities/meal_entity.dart';

class MealPlan extends Equatable {
  
  int id;
  bool activated;
  String initialDate;
  String finalDate;
  List<Meal> meals;

  MealPlan({
    required this.id,
    required this.activated,
    required this.initialDate,
    required this.finalDate,
    required this.meals,
  });

  MealPlan copyWith({
    int? id,
    bool? activated,
    String? initialDate,
    String? finalDate,
    List<Meal>? meals,
  }) {
    return MealPlan(
      id: id ?? this.id,
      activated: activated ?? this.activated,
      initialDate: initialDate ?? this.initialDate,
      finalDate: finalDate ?? this.finalDate,
      meals: meals ?? this.meals,
    );
  }

  factory MealPlan.empty() {
    return MealPlan(
      id: -1,
      activated: false,
      initialDate: "",
      finalDate: "",
      meals: const [],
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      activated,
      initialDate,
      finalDate,
      meals,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'activated': activated,
      'initialDate': initialDate,
      'finalDate': finalDate,
      'meals': meals.map((x) => x.toMap()).toList(),
    };
  }

  factory MealPlan.fromMap(Map<String, dynamic> map) {
    return MealPlan(
      id: map['id'] as int,
      activated: map['activated'] as bool,
      initialDate: map['initialDate'] as String,
      finalDate: map['finalDate'] as String,
      meals: List<Meal>.from((map['meals'] as List<int>).map<Meal>((x) => Meal.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory MealPlan.fromJson(String source) => MealPlan.fromMap(json.decode(source) as Map<String, dynamic>);
}


