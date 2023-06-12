import 'package:realm/realm.dart';
part 'record.g.dart';

@RealmModel()
class _Record {
  @PrimaryKey()
  late ObjectId id;

  late String amount;

  late int timestamp;

  late DateTime createTime;

  late String packageName;

  late String appName;

  late String notificationText;

  late String notificationTitle;

  late String uid;
}
