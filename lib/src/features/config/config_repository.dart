// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:opthalmology_mcqs/src/common/constants.dart';

import 'models/config.dart';

class ConfigRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _configDB => db.collection('config');
  Future<void> save(Config config) async {
    final config0 = _configDB.doc('config');
    config0.set(config.toMap());
    _configDB.add({CONSTANTS.CONFIG_DATABASE: config.toJson()});
  }

  Future<Config> load() async {
    final conf = _configDB.doc('config');
    return await conf.get().then((value) => Config.fromMap(value.data()!));
  }
}

class ConfigDataSource {
  var db = FirebaseFirestore.instance;

  late Box box;
  Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox(CONSTANTS.CONFIG_DATABASE);
  }

  String load(String key) {
    return box.get(key);
  }

  void save(String key, String value) {}
}
