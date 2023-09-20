import 'package:flutter/material.dart';
import 'package:spotify_flutter/widgets/layouts/player_bottom_buttons.dart';
import 'package:spotify_flutter/widgets/layouts/player_bottom_controls.dart';
import 'package:spotify_flutter/widgets/layouts/player_bottom_song_info.dart';


class PlayerBottomLayout extends StatefulWidget {
  const PlayerBottomLayout({super.key});

  @override
  State<PlayerBottomLayout> createState() => _PlayerBottomLayoutState();
}

class _PlayerBottomLayoutState extends State<PlayerBottomLayout> {
  
  

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 87,
      child: Padding(
        padding: EdgeInsets.only(top: 16, bottom: 17, left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PlayerBottomSongInfo(
              songTitle: "Утрений расвет", 
              songAuthor: "Король и Шут", 
              imageURL: "https://i.scdn.co/image/ab67616d0000b273ab541c8fff5dbd3d496e97ee"
            ),
            PlayerBottomControls(),
            PlayerBottomButtons(),
          ]
        ),
      )
    );
  }
}