// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Record extends _Record with RealmEntity, RealmObjectBase, RealmObject {
  Record(
    ObjectId id,
    String amount,
    int timestamp,
    DateTime createTime,
    String packageName,
    String appName,
    String notificationText,
    String notificationTitle,
    String uid,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'amount', amount);
    RealmObjectBase.set(this, 'timestamp', timestamp);
    RealmObjectBase.set(this, 'createTime', createTime);
    RealmObjectBase.set(this, 'packageName', packageName);
    RealmObjectBase.set(this, 'appName', appName);
    RealmObjectBase.set(this, 'notificationText', notificationText);
    RealmObjectBase.set(this, 'notificationTitle', notificationTitle);
    RealmObjectBase.set(this, 'uid', uid);
  }

  Record._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get amount => RealmObjectBase.get<String>(this, 'amount') as String;
  @override
  set amount(String value) => RealmObjectBase.set(this, 'amount', value);

  @override
  int get timestamp => RealmObjectBase.get<int>(this, 'timestamp') as int;
  @override
  set timestamp(int value) => RealmObjectBase.set(this, 'timestamp', value);

  @override
  DateTime get createTime =>
      RealmObjectBase.get<DateTime>(this, 'createTime') as DateTime;
  @override
  set createTime(DateTime value) =>
      RealmObjectBase.set(this, 'createTime', value);

  @override
  String get packageName =>
      RealmObjectBase.get<String>(this, 'packageName') as String;
  @override
  set packageName(String value) =>
      RealmObjectBase.set(this, 'packageName', value);

  @override
  String get appName => RealmObjectBase.get<String>(this, 'appName') as String;
  @override
  set appName(String value) => RealmObjectBase.set(this, 'appName', value);

  @override
  String get notificationText =>
      RealmObjectBase.get<String>(this, 'notificationText') as String;
  @override
  set notificationText(String value) =>
      RealmObjectBase.set(this, 'notificationText', value);

  @override
  String get notificationTitle =>
      RealmObjectBase.get<String>(this, 'notificationTitle') as String;
  @override
  set notificationTitle(String value) =>
      RealmObjectBase.set(this, 'notificationTitle', value);

  @override
  String get uid => RealmObjectBase.get<String>(this, 'uid') as String;
  @override
  set uid(String value) => RealmObjectBase.set(this, 'uid', value);

  @override
  Stream<RealmObjectChanges<Record>> get changes =>
      RealmObjectBase.getChanges<Record>(this);

  @override
  Record freeze() => RealmObjectBase.freezeObject<Record>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Record._);
    return const SchemaObject(ObjectType.realmObject, Record, 'Record', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('amount', RealmPropertyType.string),
      SchemaProperty('timestamp', RealmPropertyType.int),
      SchemaProperty('createTime', RealmPropertyType.timestamp),
      SchemaProperty('packageName', RealmPropertyType.string),
      SchemaProperty('appName', RealmPropertyType.string),
      SchemaProperty('notificationText', RealmPropertyType.string),
      SchemaProperty('notificationTitle', RealmPropertyType.string),
      SchemaProperty('uid', RealmPropertyType.string),
    ]);
  }
}
