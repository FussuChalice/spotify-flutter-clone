import 'package:flutter/material.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/font_controller.dart';
import 'package:spotify_flutter/fonts.dart';

class AlbumCard extends StatefulWidget {
  const AlbumCard({super.key, required this.albumTitle, required this.albumImageURL});

  final String albumImageURL, albumTitle;

  @override
  State<AlbumCard> createState() => _AlbumCardState();
}

class _AlbumCardState extends State<AlbumCard> {
  // ignore: unused_field
  bool _albumCardHovered = false;

  @override
  Widget build(BuildContext context) {
    FontController fontController = FontController(
      widget.albumTitle,
      latinFonts,
      cyrillicFonts
    );

    FontList currentFontList = fontController.getFontList();

    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _albumCardHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _albumCardHovered = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          color: _albumCardHovered ? infoBoxColor.withAlpha(250) : infoBoxColor.withAlpha(120),
        ),
        height: 64,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(6), topLeft: Radius.circular(6)),
              child: Image.network(
                widget.albumImageURL,
              ),
            ),
            const SizedBox(width: 17,),
            Text(
              widget.albumTitle,
              style: TextStyle(
                color: Colors.white,
                fontFamily: currentFontList.bold,
                fontSize: 16
              ),
            ),
          ],
        ),
      ),
    );
  }
}
