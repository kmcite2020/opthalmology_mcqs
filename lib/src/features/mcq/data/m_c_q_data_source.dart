import 'package:hive_flutter/hive_flutter.dart';
import 'package:opthalmology_mcqs/src/common/constants.dart';

import '../domain/mcq.dart';

class MCQDataSource {
  late Box box;
  Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox(CONSTANTS.MCQ_DATABASE);
  }

  Future<void> clearAll() async => box.clear();
  void addMCQ(MCQ mcq) async => await box.put(mcq.id, mcq.toJson());
}
