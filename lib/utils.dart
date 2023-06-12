Settings getSettingInstance() {
  Settings? s = realm.find<Settings>(0);
  if (s == null) {
    realm.write(() {
      realm.add(Settings(0));
    });
    s = realm.find<Settings>(0);
  }

  return s!;
}
