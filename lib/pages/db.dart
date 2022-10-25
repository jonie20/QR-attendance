import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class MyDb {
  late Database db;

  Future open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    print(path);

    Database db = await openDatabase(path,version:1,onCreate: (Database db,int version) async{
      //sql= ""
      await db.execute('''
                         CREATE TABLE IF NOT EXISTS students(
                          id primary key AUTO INCREMENT,
                          name varchar(255) not null,
                          roll_no int not null,
                          address varchar(255) not null
                         );
                  ''');
                  print("Table created");

    });
  }
  Future<Map<dynamic, dynamic>?> getStudent(int rollno) async {
    List<Map> maps = await db.query('students',
    where: 'roll_no = ?',
    whereArgs: [rollno]);

    if (maps.length > 0){
      return maps.first;
    }
    return null;
  }
  
}