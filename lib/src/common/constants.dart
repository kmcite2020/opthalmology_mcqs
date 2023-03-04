// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:opthalmology_mcqs/src/features/mcq/data/mcq_repository.dart';

final get = GetIt.instance;

class CONSTANTS {
  static const MCQ_DATABASE = 'mcq_test';
  static const CONFIG_DATABASE = 'config_test';
  static const themeModes = ThemeMode.values;
  static const colors = Colors.primaries;
  static GetIt get locator => _sl;
  static Future<void> initialize() async {
    locator.registerFactory(() => FirebaseFirestore.instance);
    locator.registerFactory(() => MCQRepository());
  }
}

final _sl = GetIt.instance;
