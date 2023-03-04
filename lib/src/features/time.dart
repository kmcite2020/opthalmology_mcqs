// ignore_for_file: library_private_types_in_public_api, unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:opthalmology_mcqs/src/common/extensions.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  final StreamController<DateTime> _timeStreamController = StreamController<DateTime>();
  late Timer _timer;
  final showDots = false.inj();
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) {
        _timeStreamController.add(DateTime.now());
        showDots.toggle();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: _timeStreamController.stream,
      builder: (BuildContext context, AsyncSnapshot<DateTime> snapshot) {
        if (snapshot.hasData) {
          final time = snapshot.data!;
          final min = time.minute;
          final sec = time.second;
          final hr = time.hour;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (hr > 9 ? '$hr' : '0$hr').textScale,
              showDots.state ? ' '.text : ':'.text,
              (min > 9 ? '$min' : '0$min').textScale,
              ':'.text,
              '${time.second}'.text,
            ],
          );
        } else {
          return 'loading'.text;
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _timeStreamController.close();
    super.dispose();
  }
}
