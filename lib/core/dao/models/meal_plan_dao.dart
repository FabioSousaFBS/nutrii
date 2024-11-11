import 'package:nutrii/core/dao/sembast/dao_db_sembast.dart';
import 'package:nutrii/core/entities/meal_plan_entity.dart';

class MealPlanDao extends DaoDbSembast<MealPlan>{
  
  MealPlanDao() : super('mealplans');
  
  @override
  MealPlan fromMap(Map<String, dynamic> map) {
    return MealPlan.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap(MealPlan item) {
    return item.toMap();
  }



}