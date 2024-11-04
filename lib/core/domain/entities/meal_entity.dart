// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:nutrii/core/domain/entities/food_entity.dart';

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
}
