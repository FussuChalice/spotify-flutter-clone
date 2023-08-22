import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_flutter/providers.dart';
import 'package:spotify_flutter/widgets/custom_slider.dart';

class Timeline extends StatefulWidget {
  const Timeline({super.key});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  Duration _currentValue = const Duration(seconds: 30);

  void _handleSliderChanged(Duration newValue) {
    setState(() {
      _currentValue = newValue;
    });
    log(_currentValue.toString());
  }

  

  @override
  Widget build(BuildContext context) {
    final trackTimeProvider = Provider.of<TrackTimeProvider>(context);

    return Expanded(
      flex: 2,
      child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                trackTimeProvider.formatDuration(_currentValue),
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.amber
                ),
              ),
              CustomSlider(
                startValue: const Duration(minutes: 0, seconds: 0),
                endValue: const Duration(minutes: 3, seconds: 40),
                currentValue: _currentValue,
                onChanged: _handleSliderChanged,
              ),
              Text(
                trackTimeProvider.formatDuration(const Duration(minutes: 3, seconds: 40)),
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.amber
                ),
              ),
            ],
      ),
    );
  }
}

