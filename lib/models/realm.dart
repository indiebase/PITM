import 'package:pitm/models/record.dart';
import 'package:realm/realm.dart';

var _config = Configuration.local(
  [
    Record.schema,
    // Settings.schema,
    RuleFields.schema,
  ],
  schemaVersion: 4,
);

var realm = Realm(_config);
