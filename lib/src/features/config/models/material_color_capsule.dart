import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../common/constants.dart';

class MaterialColorCapsule {
  final MaterialColor materialColor;
  MaterialColorCapsule({
    required this.materialColor,
  });

  MaterialColorCapsule copyWith({
    MaterialColor? materialColor,
  }) {
    return MaterialColorCapsule(
      materialColor: materialColor ?? this.materialColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'materialColor': CONSTANTS.colors.indexOf(materialColor),
    };
  }

  factory MaterialColorCapsule.fromMap(Map<String, dynamic> map) {
    return MaterialColorCapsule(
      materialColor: CONSTANTS.colors[map['materialColor']],
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialColorCapsule.fromJson(String source) => MaterialColorCapsule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MaterialColorCapsule(materialColor: $materialColor)';

  @override
  bool operator ==(covariant MaterialColorCapsule other) {
    if (identical(this, other)) return true;

    return other.materialColor == materialColor;
  }

  @override
  int get hashCode => materialColor.hashCode;
}
