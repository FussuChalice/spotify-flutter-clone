import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/widgets/custom_icon_button.dart';
import 'package:spotify_flutter/widgets/dot_indicator_box.dart';
import 'package:spotify_flutter/widgets/volume_slider.dart';

class PlayerBottomButtons extends StatefulWidget {
  const PlayerBottomButtons({super.key});

  @override
  State<PlayerBottomButtons> createState() => _PlayerBottomButtonsState();
}

class _PlayerBottomButtonsState extends State<PlayerBottomButtons> {
  bool _screenNowClicked = false;
  bool _textClicked = false;
  bool _queueClicked = false;
  bool _devicesClicked = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DotIndicatorBox(
              clicked: _screenNowClicked,
              paddingToIndicator: 4,
              clickedColor: clickedIconColor,
              paddingFromTop: 6,
              child: CustomIconButton(
                iconPath: screenNowIconAsset,
                iconButtonOnTapFunction: () {
                  setState(() {
                    _screenNowClicked = !_screenNowClicked;
                  });
                },
                blendMode: BlendMode.modulate,
                iconHeight: 16,
                focusedColor: _screenNowClicked
                    ? clickedHoveredIconColor
                    : focusedElementColor,
                unfocusedColor: _screenNowClicked
                    ? clickedIconColor
                    : unfocusedElementColor,
                iconButtonHoverFunction: () {},
              )),
          const SizedBox(
            width: 17,
          ),
          DotIndicatorBox(
              clicked: _textClicked,
              paddingToIndicator: 4,
              clickedColor: clickedIconColor,
              paddingFromTop: 6,
              child: CustomIconButton(
                iconPath: textIconAsset,
                iconButtonOnTapFunction: () {
                  setState(() {
                    _textClicked = !_textClicked;
                  });
                },
                blendMode: BlendMode.modulate,
                iconHeight: 16,
                focusedColor: _textClicked
                    ? clickedHoveredIconColor
                    : focusedElementColor,
                unfocusedColor:
                    _textClicked ? clickedIconColor : unfocusedElementColor,
                iconButtonHoverFunction: () {},
              )),
          const SizedBox(
            width: 17,
          ),
          DotIndicatorBox(
              clicked: _queueClicked,
              paddingToIndicator: 4,
              clickedColor: clickedIconColor,
              paddingFromTop: 6,
              child: CustomIconButton(
                iconPath: queueIconAsset,
                iconButtonOnTapFunction: () {
                  setState(() {
                    _queueClicked = !_queueClicked;
                  });
                },
                blendMode: BlendMode.modulate,
                iconHeight: 16,
                focusedColor: _queueClicked
                    ? clickedHoveredIconColor
                    : focusedElementColor,
                unfocusedColor:
                    _queueClicked ? clickedIconColor : unfocusedElementColor,
                iconButtonHoverFunction: () {},
              )),
          const SizedBox(
            width: 17,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: CustomIconButton(
              iconPath: devicesIconAsset,
              iconButtonOnTapFunction: () {
                setState(() {
                  _devicesClicked = !_devicesClicked;
                });
              },
              blendMode: BlendMode.modulate,
              iconHeight: 16,
              focusedColor: _devicesClicked
                  ? clickedHoveredIconColor
                  : focusedElementColor,
              unfocusedColor:
                  _devicesClicked ? clickedIconColor : unfocusedElementColor,
              iconButtonHoverFunction: () {},
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: VolumeSlider(),
          )
        ],
      ),
    );
  }
}
