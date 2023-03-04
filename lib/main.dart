// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:opthalmology_mcqs/src/common/constants.dart';
import 'package:opthalmology_mcqs/src/common/theme.dart';
import 'package:opthalmology_mcqs/src/features/config/config_controller.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'firebase_options.dart';
import 'src/features/mcq/application/mcqs_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CONSTANTS.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeController.theme,
      darkTheme: ThemeController.darkTheme,
      themeMode: configController.themeMode,
      home: const MCQsView(),
      navigatorKey: RM.navigate.navigatorKey,
    );
  }
}
