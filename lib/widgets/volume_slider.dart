import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/widgets/custom_icon_button.dart';
import 'package:spotify_flutter/widgets/custom_slider.dart';

class VolumeSlider extends StatefulWidget {
  const VolumeSlider({super.key});

  @override
  State<VolumeSlider> createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  bool _volumeButtonClicked = false;
  Duration _currentValue = const Duration(seconds: 30);

  void _handleSliderChanged(Duration newValue) {
    setState(() {
      _currentValue = newValue;
    });

    if (_currentValue == Duration.zero) {
      setState(() {
        _volumeButtonClicked = true;
      });
    } else {
      setState(() {
        _volumeButtonClicked = false;
      });
    }

    log(_currentValue.toString());
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconButton(
          iconPath: _volumeButtonClicked ? volumeMutedIconAsset : volumeIconAsset, 
          iconButtonOnTapFunction: () {
            setState(() {
              _volumeButtonClicked = !_volumeButtonClicked;
            });

            if (_volumeButtonClicked) {
              setState(() {
                _currentValue = Duration.zero;
              });
            }
          }, 
          focusedColor: _volumeButtonClicked ? unfocusedElementColor : focusedElementColor, 
          unfocusedColor: _volumeButtonClicked ? focusedElementColor : unfocusedElementColor, 
          iconButtonHoverFunction: () {}, 
          iconHeight: 16, 
          blendMode: BlendMode.modulate
        ),
        const SizedBox(width: 10,),
        Padding(
          padding: const EdgeInsets.only(bottom: 32), 
          child: CustomSlider(
          startValue: Duration.zero, 
          endValue: const Duration(seconds: 100), 
          currentValue: _currentValue,
          onChanged: _handleSliderChanged,
          width: 100,
          ),
        )
      ],
    );
  }
}