import 'package:nutrii/core/dao/app_database_sembast.dart';
import 'package:sembast/sembast.dart';


abstract class DaoDbSembast<T> {

  final String storeName;
  final StoreRef<int, Map<String, dynamic>> store;

  DaoDbSembast(this.storeName) : store = intMapStoreFactory.store(storeName);
  
  Future<Database> get _db async => await AppDatabaseSembast().database;
  
  Future<int> insert(T item) async {
    return await store.add(await _db, toMap(item));
  }

  Future<List<T>> getAll() async {
    final snapshots = await store.find(await _db);
    return snapshots.map((snapshot) => fromMap(snapshot.value)).toList();
  }

  Future<T?> getById(int id) async {
    final record = await store.record(id).get(await _db);
    return record != null ? fromMap(record) : null;
  }

  Future<List<T>> query(String sql, [List<dynamic>? arguments]) async {   
    
    if (arguments != null) {
      final finder = Finder(
        filter: Filter.custom((record) {
          return record['description'] == arguments[0]; 
        }),
      );
      final snapshot = await store.find(await _db, finder: finder);
      return snapshot.map((record) => fromMap(record.value)).toList();      
    } else {
      final snapshot = await store.find(await _db);

      return snapshot.map((record) => fromMap(record.value)).toList();          
    }
  }

  Future<Map<String, dynamic>?> update(int id, T item) async {
    return await store.record(id).update(await _db, toMap(item));
  }

  Future<int?> delete(int id) async {
    return await store.record(id).delete(await _db);
  }

  Map<String, dynamic> toMap(T item);
  T fromMap(Map<String, dynamic> map);

}