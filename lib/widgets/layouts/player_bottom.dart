import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/widgets/custom_icon_button.dart';
import 'package:spotify_flutter/widgets/dot_indicator_box.dart';
import 'package:spotify_flutter/widgets/layouts/player_bottom_buttons.dart';
import 'package:spotify_flutter/widgets/layouts/player_bottom_controls.dart';
import 'package:spotify_flutter/widgets/layouts/player_bottom_song_info.dart';
import 'package:spotify_flutter/widgets/player_button.dart';
import 'package:spotify_flutter/widgets/timeline.dart';
import 'package:spotify_flutter/widgets/volume_slider.dart';


class PlayerBottomLayout extends StatefulWidget {
  const PlayerBottomLayout({super.key});

  @override
  State<PlayerBottomLayout> createState() => _PlayerBottomLayoutState();
}

class _PlayerBottomLayoutState extends State<PlayerBottomLayout> {
  
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 87,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 17, left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            PlayerBottomSongInfo(
              songTitle: "Test Song", 
              songAuthor: "Kuntura", 
              imagePath: testImage
            ),
            PlayerBottomControls(),
            PlayerBottomButtons(),
          ]
        ),
      )
    );
  }
}