import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/widgets/custom_icon_button.dart';
import 'package:spotify_flutter/widgets/dot_indicator_box.dart';
import 'package:spotify_flutter/widgets/player_button.dart';
import 'package:spotify_flutter/widgets/timeline.dart';


class PlayerBottomLayout extends StatefulWidget {
  const PlayerBottomLayout({super.key});

  @override
  State<PlayerBottomLayout> createState() => _PlayerBottomLayoutState();
}

class _PlayerBottomLayoutState extends State<PlayerBottomLayout> {
  String songTitle = "Song Title";
  String songAuthor = "Song Author";

  bool _songTitleHovered = false;
  bool _songAuthorHovered = false;
  bool _songLikeClicked = false;

  bool _audioPlayerRandomClicked = false;
  bool _audioPlayerLoopClicked = false;
  bool _audioPlayerStarted = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 87,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 17, left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(3), // Half of the height or width to create a circle effect
                      child: Image.asset(
                        testImage,
                        height: 56,
                        width: 56,
                        fit: BoxFit.cover, // You can adjust the fit as needed
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 15, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ 
                            MouseRegion(
                              onEnter: (event) {
                                setState(() {
                                  _songTitleHovered = true;
                                });
                              },
                              onExit: (event) {
                                setState(() {
                                  _songTitleHovered = false;
                                });
                              },
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: null,
                                child: Text(
                                  songTitle,
                                  style: TextStyle(
                                    color: focusedElementColor,
                                    fontFamily: 'CircularSp-Book',
                                    decoration: _songTitleHovered ? TextDecoration.underline : TextDecoration.none,
                                  ),
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                            MouseRegion(
                              onEnter: (event) {
                                setState(() {
                                  _songAuthorHovered = true;
                                });
                              },
                              onExit: (event) {
                                setState(() {
                                  _songAuthorHovered = false;
                                });
                              },
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: null,
                                child: Text(
                                  songAuthor,
                                  style: TextStyle(
                                    color: unfocusedElementColor,
                                    fontFamily: 'CircularSp-Book',
                                    decoration: _songAuthorHovered ? TextDecoration.underline : TextDecoration.none,
                                    fontSize: 10,
                                  ),
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ),
                    CustomIconButton(
                      iconPath: _songLikeClicked ? likeFilledIconAsset: likeUnfilledIconAsset, 
                      iconButtonOnTapFunction: () {
                        setState(() {
                          _songLikeClicked = !_songLikeClicked;
                        });
                      }, 
                      focusedColor: _songLikeClicked ? clickedHoveredIconColor: focusedElementColor, 
                      unfocusedColor: _songLikeClicked ? clickedIconColor : unfocusedElementColor,
                      blendMode: BlendMode.modulate,
                      iconButtonHoverFunction: () {}, 
                      iconHeight: 16
                    ),
                    const SizedBox(width: 20,)
                  ],
                ),
            ),
            Expanded(
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
                              _audioPlayerRandomClicked = !_audioPlayerRandomClicked;
                            });
                          },
                          blendMode: BlendMode.modulate,
                          focusedColor: _audioPlayerRandomClicked ? clickedHoveredIconColor: focusedElementColor, 
                          unfocusedColor: _audioPlayerRandomClicked ? clickedIconColor : infoBoxColor, 
                          iconButtonHoverFunction: () {}, 
                          iconHeight: 16
                        )
                      ),
                      const SizedBox(width: 25,),
                      CustomIconButton(
                        iconPath: audioPlayerBackIconAsset, 
                        iconButtonOnTapFunction: () {}, 
                        focusedColor: focusedElementColor, 
                        unfocusedColor: unfocusedElementColor, 
                        iconButtonHoverFunction: () {}, 
                        iconHeight: 16, 
                        blendMode: BlendMode.modulate
                      ),
                      const SizedBox(width: 25,),
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
                        height: 32, width: 32, 
                        startPlayerButtonIconPath: audioPlayerStartIcon, 
                        stopPlayerButtonIconPath: audioPlayerStopIcon
                      ),
                      const SizedBox(width: 25,),
                      CustomIconButton(
                        iconPath: audioPlayerNextIcon, 
                        iconButtonOnTapFunction: () {}, 
                        focusedColor: focusedElementColor, 
                        unfocusedColor: unfocusedElementColor, 
                        iconButtonHoverFunction: () {}, 
                        iconHeight: 16, 
                        blendMode: BlendMode.modulate
                      ),
                      const SizedBox(width: 25,),
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
                          focusedColor: _audioPlayerLoopClicked ? clickedHoveredIconColor: focusedElementColor, 
                          unfocusedColor: _audioPlayerLoopClicked ? clickedIconColor : infoBoxColor, 
                          iconButtonHoverFunction: () {}, 
                          iconHeight: 16
                        )
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Timeline(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(color: Colors.blue),
            ),
          ]
        ),
      )
    );
  }
}