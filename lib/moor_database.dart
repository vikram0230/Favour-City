import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Favourites extends Table {
  TextColumn get city => text().withLength(min: 1, max: 100)();
  TextColumn get district => text().withLength(min: 1, max: 100)();
  TextColumn get state => text().withLength(min: 1, max: 100)();

  @override
  Set<Column> get primaryKey => {city};
}

@UseMoor(tables: [Favourites])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite', logStatements: true,
  ));

  @override
  int get schemaVersion => 1;

  // All tables have getters in the generated class - we can select the tasks table
  Future<List<Favourite>> getAllTasks() => select(favourites).get();

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<Favourite>> watchAllTasks() => select(favourites).watch();

  Future insertTask(Favourite favourite) => into(favourites).insert(favourite);

  // Updates a Task with a matching primary key
  Future updateTask(Favourite favourite) => update(favourites).replace(favourite);

  Future deleteTask(Favourite favourite) => delete(favourites).delete(favourite);
}
