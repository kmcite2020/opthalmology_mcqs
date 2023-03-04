// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:opthalmology_mcqs/src/features/config/config_repository.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ConfigController {
  final ConfigRepository repository;
  ConfigController({
    required this.repository,
  });

  late final configRM = RM.inject<dynamic>(() => null);
  get color => configRM.state.materialColorCapsule.materialColor;
  get themeMode => configRM.state.themeModeCapsule.themeMode;
}

final ConfigController configController = ConfigController(repository: ConfigRepository());
