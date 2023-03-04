import 'package:flutter/material.dart';

extension PaddingX on Widget {
  Widget get pad => Padding(padding: const EdgeInsets.all(8), child: this);
}

extension TextX on String {
  Text get text => Text(this);
  Text get textScale => Text(this, textScaleFactor: 1.5);
  Text get textScale2 => Text(this, textScaleFactor: 2);
  Text get textScale4 => Text(this, textScaleFactor: 4);
  Text get textScale6 => Text(this, textScaleFactor: 6);
  Text get textScale8 => Text(this, textScaleFactor: 8);
}
