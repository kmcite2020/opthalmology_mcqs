// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'material_color_capsule.dart';
import 'theme_mode_capsule.dart';

class Config {
  final MaterialColorCapsule materialColorCapsule;
  final ThemeModeCapsule themeModeCapsule;
  Config({
    required this.materialColorCapsule,
    required this.themeModeCapsule,
  });

  Config copyWith({
    MaterialColorCapsule? materialColorCapsule,
    ThemeModeCapsule? themeModeCapsule,
  }) {
    return Config(
      materialColorCapsule: materialColorCapsule ?? this.materialColorCapsule,
      themeModeCapsule: themeModeCapsule ?? this.themeModeCapsule,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'materialColorCapsule': materialColorCapsule.toMap(),
      'themeModeCapsule': themeModeCapsule.toMap(),
    };
  }

  factory Config.fromMap(Map<String, dynamic> map) {
    return Config(
      materialColorCapsule: MaterialColorCapsule.fromMap(map['materialColorCapsule']),
      themeModeCapsule: ThemeModeCapsule.fromMap(map['themeModeCapsule']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Config.fromJson(String source) => Config.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Config(materialColorCapsule: $materialColorCapsule, themeModeCapsule: $themeModeCapsule)';

  @override
  bool operator ==(covariant Config other) {
    if (identical(this, other)) return true;

    return other.materialColorCapsule == materialColorCapsule && other.themeModeCapsule == themeModeCapsule;
  }

  @override
  int get hashCode => materialColorCapsule.hashCode ^ themeModeCapsule.hashCode;
}
