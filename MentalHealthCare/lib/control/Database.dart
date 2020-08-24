import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String activityTable = "activityTable";      //nome da tabela de atividades (Meditação, exercícios e respiração)
final String scheduleTable = "scheduleTable";      //nome da tabela Agenda
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String posColumn = "posColumn";
final String okColumn = "okColumn";

class ContactHelper {

  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database _db;

  Future<Database> get db async {
    if(_db != null){
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "mental.db");

    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute(
        "CREATE TABLE $activityTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $posColumn TEXT)"
      );
      await db.execute(
        "CREATE TABLE $scheduleTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $okColumn TEXT)"
      );
    });
  }

//--------------------------Escrevendo dados nas tabelas---------------------------- 
  Future<AgendaDB> saveAgenda(AgendaDB ag) async {
    Database dbContact = await db;
    ag.id = await dbContact.insert(scheduleTable, ag.toMap());
    return ag;
  }

  Future<AtividadeDB> saveAtividade(AtividadeDB at) async {
    Database dbContact = await db;
    at.id = await dbContact.insert(activityTable, at.toMap());
    return at;
  }
//--------------------------Colhendo informações das tabelas-------------------------
  Future<AgendaDB> getAgenda(int id) async {
    Database dbContact = await db;
    List<Map> maps = await dbContact.query(scheduleTable,
      columns: [idColumn, nameColumn, okColumn],
      where: "$idColumn = ?",
      whereArgs: [id]);
    if(maps.length > 0){
      return AgendaDB.fromMap(maps.first);
    } else {
      return null;
    }
  }

   Future<AtividadeDB> getAtividade(int id) async {
    Database dbContact = await db;
    List<Map> maps = await dbContact.query(activityTable,
      columns: [idColumn, nameColumn, posColumn],
      where: "$idColumn = ?",
      whereArgs: [id]);
    if(maps.length > 0){
      return AtividadeDB.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List> getAllAgenda() async {
    Database dbContact = await db;
    List listMap = await dbContact.rawQuery("SELECT * FROM $scheduleTable"); 
    List<AgendaDB> listContact = List();
    for(Map m in listMap){
      listContact.add(AgendaDB.fromMap(m));
    }
    return listContact;
  }

  Future<List> getAllAtividade() async {
    Database dbContact = await db;
    List listMap = await dbContact.rawQuery("SELECT * FROM $activityTable");
    List<AtividadeDB> listContact = List();
    for(Map m in listMap){
      listContact.add(AtividadeDB.fromMap(m));
    }
    return listContact;
  }
  //---------------------------Deletando dado das tabelas-----------------------------------
  Future<int> deleteAgenda(int id) async {
    Database dbContact = await db;
    return await dbContact.delete(scheduleTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> deleteAtividade(int id) async {
    Database dbContact = await db;
    return await dbContact.delete(activityTable, where: "$idColumn = ?", whereArgs: [id]);
  }
  //--------------------------Atualizando dado nas tabelas-----------------------------------

  Future<int> updateAgenda(AgendaDB ag) async {
    Database dbContact = await db;
    return await dbContact.update(scheduleTable,
        ag.toMap(),
        where: "$idColumn = ?",
        whereArgs: [ag.id]);
  }

  Future<int> updateAtividade(AtividadeDB at) async {
    Database dbContact = await db;
    return await dbContact.update(activityTable,
        at.toMap(),
        where: "$idColumn = ?",
        whereArgs: [at.id]);
  }

  //--------------------------Checando o tamanho das tabelas----------------------------------

  Future<int> getNumberAgenda() async {
    Database dbContact = await db;
    return Sqflite.firstIntValue(await dbContact.rawQuery("SELECT COUNT(*) FROM $scheduleTable"));
  }

  Future<int> getNumberAtividade() async {
    Database dbContact = await db;
    return Sqflite.firstIntValue(await dbContact.rawQuery("SELECT COUNT(*) FROM $activityTable"));
  }

  //--------------------------Fechando conexão com o banco de dados---------------------------
  Future close() async {
    Database dbContact = await db;
    dbContact.close();
  }

}

class AgendaDB {

  int id;
  String title;
  String ok;

  AgendaDB();

  AgendaDB.fromMap(Map map){
    id = map[idColumn];
    title = map[nameColumn];
    ok = map[okColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: title,
      okColumn: ok
    
    };
    if(id != null){
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Agenda(id: $id, title: $title, ok: $ok)";
  }

}

class AtividadeDB {

  int id;
  String name;
  String pos;
  
  AtividadeDB();

  AtividadeDB.fromMap(Map map){
    id = map[idColumn];
    name = map[nameColumn];
    pos = map[posColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      posColumn: pos,
    };
    if(id != null){
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Atividade: (id: $id, name: $name, pos: $pos)";
  }

}