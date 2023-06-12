import 'dart:typed_data';
import 'package:realm/realm.dart';
part 'rule.g.dart';

@RealmModel()
class _Rule {
  @PrimaryKey()
  late ObjectId id;

  late String appName;

  late String packageName;

  late String callbackUrl;

  late String matchPattern;

  late String callbackHttpMethod;

  late Uint8List icon;
}
