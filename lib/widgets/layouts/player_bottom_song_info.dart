import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/widgets/custom_icon_button.dart';

class PlayerBottomSongInfo extends StatefulWidget {
  const PlayerBottomSongInfo({
    super.key, required this.songTitle, required this.songAuthor, required this.imagePath});

  final String songTitle, songAuthor, imagePath;

  @override
  State<PlayerBottomSongInfo> createState() => _PlayerBottomSongInfoState();
}

class _PlayerBottomSongInfoState extends State<PlayerBottomSongInfo> {

  bool _songTitleHovered = false;
  bool _songAuthorHovered = false;
  bool _songLikeClicked = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
                3), // Half of the height or width to create a circle effect
            child: Image.asset(
              widget.imagePath,
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
                      widget.songTitle,
                      style: TextStyle(
                        color: focusedElementColor,
                        fontFamily: 'CircularSp-Book',
                        decoration: _songTitleHovered
                            ? TextDecoration.underline
                            : TextDecoration.none,
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
                      widget.songAuthor,
                      style: TextStyle(
                        color: unfocusedElementColor,
                        fontFamily: 'CircularSp-Book',
                        decoration: _songAuthorHovered
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        fontSize: 10,
                      ),
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
          )),
          CustomIconButton(
              iconPath: _songLikeClicked
                  ? likeFilledIconAsset
                  : likeUnfilledIconAsset,
              iconButtonOnTapFunction: () {
                setState(() {
                  _songLikeClicked = !_songLikeClicked;
                });
              },
              focusedColor: _songLikeClicked
                  ? clickedHoveredIconColor
                  : focusedElementColor,
              unfocusedColor:
                  _songLikeClicked ? clickedIconColor : unfocusedElementColor,
              blendMode: BlendMode.modulate,
              iconButtonHoverFunction: () {},
              iconHeight: 16),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
