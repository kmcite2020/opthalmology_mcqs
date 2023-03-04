import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../common/constants.dart';

class ThemeModeCapsule {
  final ThemeMode themeMode;
  ThemeModeCapsule({
    required this.themeMode,
  });

  @override
  bool operator ==(covariant ThemeModeCapsule other) {
    if (identical(this, other)) return true;

    return other.themeMode == themeMode;
  }

  @override
  int get hashCode => themeMode.hashCode;

  ThemeModeCapsule copyWith({
    ThemeMode? themeMode,
  }) {
    return ThemeModeCapsule(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'themeMode': CONSTANTS.themeModes.indexOf(themeMode),
    };
  }

  factory ThemeModeCapsule.fromMap(Map<String, dynamic> map) {
    return ThemeModeCapsule(
      themeMode: CONSTANTS.themeModes[map['themeMode']],
    );
  }

  String toJson() => json.encode(toMap());

  factory ThemeModeCapsule.fromJson(String source) => ThemeModeCapsule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ThemeModeCapsule(themeMode: $themeMode)';
}
