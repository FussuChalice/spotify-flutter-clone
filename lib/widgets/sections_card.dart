import 'package:flutter/material.dart';
import 'package:gettext_i18n/gettext_i18n.dart';
import 'package:spotify_flutter/assets.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/font_controller.dart';
import 'package:spotify_flutter/fonts.dart';
import 'package:spotify_flutter/widgets/player_button.dart';

typedef SectionCardCallback = void Function();

class SectionCard extends StatefulWidget {
  const SectionCard({
    Key? key,
    required this.mainImageURL,
    required this.headerText,
    required this.paragraphText,
    required this.callback,
    required this.showPlayerButton,
    required this.roundImage,
  }) : super(key: key);

  final String mainImageURL, headerText, paragraphText;
  final SectionCardCallback callback;
  final bool showPlayerButton, roundImage;

  @override
  State<SectionCard> createState() => _SectionCardState();
}

class _SectionCardState extends State<SectionCard> {
  bool _sectionCardHovered = false;
  bool _sectionButtonIsClicked = false;

  @override
  Widget build(BuildContext context) {
    FontController fontController =
        FontController(context.t("Home"), latinFonts, cyrillicFonts);

    FontList currentFontList = fontController.getFontList();

    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _sectionCardHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _sectionCardHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 208,
        decoration: BoxDecoration(
          color: _sectionCardHovered
              ? sectionCardColor
              : sectionCardColor.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Shadow color
              offset: const Offset(0, 0), // Offset from top-left corner
              blurRadius: 15, // Spread or blur radius
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double containerWidth = constraints.maxWidth;
                  return Container(
                    width: containerWidth,
                    height: containerWidth,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // Shadow color
                          offset:
                              const Offset(0, 0), // Offset from top-left corner
                          blurRadius: 15, // Spread or blur radius
                        )
                      ],
                      image: DecorationImage(
                        image: NetworkImage(widget.mainImageURL),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      children: [
                        if (widget.showPlayerButton && _sectionCardHovered ||
                            _sectionButtonIsClicked)
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: PlayerButton(
                              buttonIsClicked: _sectionButtonIsClicked,
                              playerButtonColor: clickedIconColor,
                              playerButtonHoveredColor: clickedHoveredIconColor,
                              iconSize: 44.0,
                              padding: const EdgeInsets.all(12.0),
                              imageSize: 5.0,
                              startPlayerButtonIconPath: audioPlayerStartIcon,
                              stopPlayerButtonIconPath: audioPlayerStopIcon,
                              startFunction: () {
                                setState(() {
                                  _sectionButtonIsClicked = true;
                                });
                              },
                              stopFunction: () {
                                setState(() {
                                  _sectionButtonIsClicked = false;
                                });
                              },
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.headerText,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: currentFontList.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.paragraphText,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: currentFontList.book,
                  fontSize: 16,
                  color: unfocusedElementColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
