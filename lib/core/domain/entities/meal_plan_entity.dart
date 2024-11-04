// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:nutrii/core/domain/entities/meal_entity.dart';

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
}


