import 'package:nutrii/core/dao/sembast/dao_db_sembast.dart';
import 'package:nutrii/core/entities/food_entity.dart';

class FoodDao extends DaoDbSembast<Food>{

  FoodDao() : super('foods');

  @override
  Food fromMap(Map<String, dynamic> map) {
    return Food.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap(Food item) {
    return item.toMap();
  }

}