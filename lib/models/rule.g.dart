// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Rule extends _Rule with RealmEntity, RealmObjectBase, RealmObject {
  Rule(
    ObjectId id,
    String appName,
    String packageName,
    String callbackUrl,
    String matchPattern,
    String callbackHttpMethod,
    Uint8List icon,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'appName', appName);
    RealmObjectBase.set(this, 'packageName', packageName);
    RealmObjectBase.set(this, 'callbackUrl', callbackUrl);
    RealmObjectBase.set(this, 'matchPattern', matchPattern);
    RealmObjectBase.set(this, 'callbackHttpMethod', callbackHttpMethod);
    RealmObjectBase.set(this, 'icon', icon);
  }

  Rule._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get appName => RealmObjectBase.get<String>(this, 'appName') as String;
  @override
  set appName(String value) => RealmObjectBase.set(this, 'appName', value);

  @override
  String get packageName =>
      RealmObjectBase.get<String>(this, 'packageName') as String;
  @override
  set packageName(String value) =>
      RealmObjectBase.set(this, 'packageName', value);

  @override
  String get callbackUrl =>
      RealmObjectBase.get<String>(this, 'callbackUrl') as String;
  @override
  set callbackUrl(String value) =>
      RealmObjectBase.set(this, 'callbackUrl', value);

  @override
  String get matchPattern =>
      RealmObjectBase.get<String>(this, 'matchPattern') as String;
  @override
  set matchPattern(String value) =>
      RealmObjectBase.set(this, 'matchPattern', value);

  @override
  String get callbackHttpMethod =>
      RealmObjectBase.get<String>(this, 'callbackHttpMethod') as String;
  @override
  set callbackHttpMethod(String value) =>
      RealmObjectBase.set(this, 'callbackHttpMethod', value);

  @override
  Uint8List get icon =>
      RealmObjectBase.get<Uint8List>(this, 'icon') as Uint8List;
  @override
  set icon(Uint8List value) => RealmObjectBase.set(this, 'icon', value);

  @override
  Stream<RealmObjectChanges<Rule>> get changes =>
      RealmObjectBase.getChanges<Rule>(this);

  @override
  Rule freeze() => RealmObjectBase.freezeObject<Rule>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Rule._);
    return const SchemaObject(ObjectType.realmObject, Rule, 'Rule', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('appName', RealmPropertyType.string),
      SchemaProperty('packageName', RealmPropertyType.string),
      SchemaProperty('callbackUrl', RealmPropertyType.string),
      SchemaProperty('matchPattern', RealmPropertyType.string),
      SchemaProperty('callbackHttpMethod', RealmPropertyType.string),
      SchemaProperty('icon', RealmPropertyType.binary),
    ]);
  }
}
