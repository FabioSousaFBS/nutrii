import 'package:nutrii/core/dao/sembast/dao_db_sembast.dart';
import 'package:nutrii/core/entities/meal_entity.dart';

class MealDao extends DaoDbSembast<Meal>{
  MealDao() : super('meals');

  @override
  fromMap(Map<String, dynamic> map) {
    return Meal.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap(Meal item) {
    return item.toMap();
  }

}