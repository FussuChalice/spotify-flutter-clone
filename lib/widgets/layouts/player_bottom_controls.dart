import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/widgets/custom_icon_button.dart';
import 'package:spotify_flutter/widgets/dot_indicator_box.dart';
import 'package:spotify_flutter/widgets/player_button.dart';
import 'package:spotify_flutter/widgets/timeline.dart';

class PlayerBottomControls extends StatefulWidget {
  const PlayerBottomControls({super.key});

  @override
  State<PlayerBottomControls> createState() => _PlayerBottomControlsState();
}

class _PlayerBottomControlsState extends State<PlayerBottomControls> {
  bool _audioPlayerRandomClicked = false;
  bool _audioPlayerLoopClicked = false;
  bool _audioPlayerStarted = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DotIndicatorBox(
                  clicked: _audioPlayerRandomClicked,
                  paddingToIndicator: 4,
                  paddingFromTop: 6,
                  clickedColor: clickedIconColor,
                  child: CustomIconButton(
                      iconPath: audioPlayerRandomIcon,
                      iconButtonOnTapFunction: () {
                        setState(() {
                          _audioPlayerRandomClicked =
                              !_audioPlayerRandomClicked;
                        });
                      },
                      blendMode: BlendMode.modulate,
                      focusedColor: _audioPlayerRandomClicked
                          ? clickedHoveredIconColor
                          : focusedElementColor,
                      unfocusedColor: _audioPlayerRandomClicked
                          ? clickedIconColor
                          : infoBoxColor,
                      iconButtonHoverFunction: () {},
                      iconHeight: 16)),
              const SizedBox(
                width: 25,
              ),
              CustomIconButton(
                  iconPath: audioPlayerBackIconAsset,
                  iconButtonOnTapFunction: () {},
                  focusedColor: focusedElementColor,
                  unfocusedColor: unfocusedElementColor,
                  iconButtonHoverFunction: () {},
                  iconHeight: 16,
                  blendMode: BlendMode.modulate),
              const SizedBox(
                width: 25,
              ),
              PlayerButton(
                  startFunction: () {
                    setState(() {
                      _audioPlayerStarted = !_audioPlayerStarted;
                    });
                  },
                  stopFunction: () {
                    setState(() {
                      _audioPlayerStarted = !_audioPlayerStarted;
                    });
                  },
                  buttonIsClicked: _audioPlayerStarted,
                  playerButtonColor: Colors.white,
                  playerButtonHoveredColor: Colors.white,
                  height: 32,
                  width: 32,
                  startPlayerButtonIconPath: audioPlayerStartIcon,
                  stopPlayerButtonIconPath: audioPlayerStopIcon),
              const SizedBox(
                width: 25,
              ),
              CustomIconButton(
                  iconPath: audioPlayerNextIcon,
                  iconButtonOnTapFunction: () {},
                  focusedColor: focusedElementColor,
                  unfocusedColor: unfocusedElementColor,
                  iconButtonHoverFunction: () {},
                  iconHeight: 16,
                  blendMode: BlendMode.modulate),
              const SizedBox(
                width: 25,
              ),
              DotIndicatorBox(
                  clicked: _audioPlayerLoopClicked,
                  paddingToIndicator: 4,
                  paddingFromTop: 6,
                  clickedColor: clickedIconColor,
                  child: CustomIconButton(
                      iconPath: audioPlayerLoopIcon,
                      iconButtonOnTapFunction: () {
                        setState(() {
                          _audioPlayerLoopClicked = !_audioPlayerLoopClicked;
                        });
                      },
                      blendMode: BlendMode.modulate,
                      focusedColor: _audioPlayerLoopClicked
                          ? clickedHoveredIconColor
                          : focusedElementColor,
                      unfocusedColor: _audioPlayerLoopClicked
                          ? clickedIconColor
                          : infoBoxColor,
                      iconButtonHoverFunction: () {},
                      iconHeight: 16)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Timeline(),
        ],
      ),
    );
  }
}
