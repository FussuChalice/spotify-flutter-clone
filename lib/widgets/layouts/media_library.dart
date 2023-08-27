import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/font_controller.dart';
import 'package:spotify_flutter/fonts.dart';
import 'package:spotify_flutter/providers.dart';
import 'package:spotify_flutter/widgets/info_box.dart';
import 'package:spotify_flutter/widgets/shell.dart';
import 'package:spotify_flutter/widgets/white_elevated_button.dart';

import 'package:gettext_i18n/gettext_i18n.dart';
import 'package:provider/provider.dart';

class MediaLibraryLayout extends StatefulWidget {
  const MediaLibraryLayout({super.key, required this.mode});

  final int mode;

  @override
  State<MediaLibraryLayout> createState() => _MediaLibraryLayoutState();
}

class _MediaLibraryLayoutState extends State<MediaLibraryLayout> {
  bool _mediaLibraryHovered = false;
  bool _addPlayListHovered = false;
  bool _zoomLibraryArrowHovered = false;
  // bool _addPlayListWhiteButtonHovered = false;

  @override
  Widget build(BuildContext context) {
    final menuModeProvider = Provider.of<MenuModeProvider>(context);
    
    FontController fontController = FontController(
      context.t("Home"),
      latinFonts,
      cyrillicFonts
    );

    FontList currentFontList = fontController.getFontList();

    return Expanded(
        child: Shell(
            child: Column(
      children: [
        SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          _mediaLibraryHovered = true;
                        });
                      },
                      cursor: SystemMouseCursors.click,
                      onExit: (event) {
                        setState(() {
                          _mediaLibraryHovered = false;
                        });
                      },
                      child: GestureDetector(
                        onTap: () {
                          menuModeProvider
                              .setMenuMode(widget.mode == 0 ? 1 : 0);
                        },
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 26,
                            ),
                            Image.asset(
                              widget.mode == 0
                                  ? mediaLibraryFocusedIconAsset
                                  : mediaLibraryUnfocusedIconAsset,
                              color: _mediaLibraryHovered
                                  ? focusedElementColor
                                  : unfocusedElementColor,
                              colorBlendMode: BlendMode.modulate,
                              height: 24,
                              fit: BoxFit.fitHeight,
                            ),
                            if (widget.mode == 0)
                              (const SizedBox(
                                width: 15,
                              )),
                            if (widget.mode == 0)
                              (Text(
                                context.t("Your Library"),
                                style: TextStyle(
                                  fontFamily: currentFontList.bold,
                                  fontSize: 16,
                                  color: _mediaLibraryHovered
                                      ? focusedElementColor
                                      : unfocusedElementColor,
                                ),
                              ))
                          ],
                        ),
                      ))),
              if (widget.mode == 0)
                (SizedBox(
                  child: Row(
                    children: [
                      MouseRegion(
                        onEnter: ((event) {
                          setState(() {
                            _addPlayListHovered = true;
                          });
                        }),
                        onExit: ((event) {
                          setState(() {
                            _addPlayListHovered = false;
                          });
                        }),
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          height: 30,
                          width: 30,
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _addPlayListHovered
                                ? hoveredBackgroundElementColor
                                : Colors.transparent,
                          ),
                          child: Image.asset(
                            addIconAsset,
                            color: _addPlayListHovered
                                ? focusedElementColor
                                : unfocusedElementColor,
                            colorBlendMode: BlendMode.modulate,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      MouseRegion(
                        onEnter: ((event) {
                          setState(() {
                            _zoomLibraryArrowHovered = true;
                          });
                        }),
                        onExit: ((event) {
                          setState(() {
                            _zoomLibraryArrowHovered = false;
                          });
                        }),
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          height: 30,
                          width: 30,
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _zoomLibraryArrowHovered
                                ? hoveredBackgroundElementColor
                                : Colors.transparent,
                          ),
                          child: Image.asset(
                            arrowIconAsset,
                            color: _zoomLibraryArrowHovered
                                ? focusedElementColor
                                : unfocusedElementColor,
                            colorBlendMode: BlendMode.modulate,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ))
            ],
          ),
        ),
        if (widget.mode == 0)
          (SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 7, right: 7, top: 10),
                child: InfoBox(
                    headerText: context.t("Create your first playlist"),
                    paragraphText: context.t("It's easy, we'll help you"),
                    button: WhiteElevatedButton(
                        callback: () {},
                        elevatedButtonText: Text(
                          context.t("New Playlist"),
                          style: TextStyle(fontFamily: currentFontList.bold),
                        ))),
              ))),
        if (widget.mode == 0)
          (SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 7, right: 7, top: 24),
              child: InfoBox(
                  headerText: context.t("Let's find some podcasts to follow"),
                  paragraphText:
                      context.t("We'll keep you updated on new episodes"),
                  button: WhiteElevatedButton(
                      callback: () {},
                      elevatedButtonText: Text(
                        context.t("Browse podcasts"),
                        style: TextStyle(fontFamily: currentFontList.bold),
                      ))),
            ),
          )),
        if (widget.mode == 1)
          (MouseRegion(
            onEnter: ((event) {
              setState(() {
                _addPlayListHovered = true;
              });
            }),
            onExit: ((event) {
              setState(() {
                _addPlayListHovered = false;
              });
            }),
            cursor: SystemMouseCursors.click,
            child: Container(
              height: 30,
              width: 30,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _addPlayListHovered
                    ? hoveredBackgroundElementColor
                    : Colors.transparent,
              ),
              child: Image.asset(
                addIconAsset,
                color: _addPlayListHovered
                    ? focusedElementColor
                    : unfocusedElementColor,
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          ))
      ],
    )));
  }
}
