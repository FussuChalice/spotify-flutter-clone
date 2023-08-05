import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets.dart';
import 'package:spotify_flutter/components/custom_white_elevated_button_component.dart';
import 'package:spotify_flutter/styles/colors.dart';
import 'package:spotify_flutter/styles/container_decorations.dart';
import 'package:gettext_i18n/gettext_i18n.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class MediaLibraryComponent extends StatefulWidget {
  const MediaLibraryComponent({super.key, required this.mode});

  final int mode;

  @override
  State<MediaLibraryComponent> createState() => _MediaLibraryComponentState();
}

class _MediaLibraryComponentState extends State<MediaLibraryComponent> {
  bool _mediaLibaryHovered = false;
  bool _addPlayListHovered = false;
  bool _zoomLibraryArrowHovered = false;
  bool _addPlayListWhiteButtonHovered = false;

  @override
  Widget build(BuildContext context) {
    final menuModeProvider = Provider.of<MenuModeProvider>(context);

    return Expanded(
      child: Container(
        decoration: globalWrapperDecoration,
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
                            _mediaLibaryHovered = true;
                          });
                        },
                        cursor: SystemMouseCursors.click,
                        onExit: (event) {
                          setState(() {
                            _mediaLibaryHovered = false;
                          });
                        },
                        child: GestureDetector(
                          onTap: () {
                            menuModeProvider.setMenuMode(widget.mode == 0 ? 1 : 0);
                          },
                          child: Row(
                            children: [
                              const SizedBox(width: 26,),
                              Image.asset(
                                widget.mode == 0 ? mediaLibraryFocusedIconAsset : mediaLibraryUnfocusedIconAsset,
                                color: _mediaLibaryHovered ? focusedElementColor : unfocusedElementColor,
                                colorBlendMode: BlendMode.modulate,
                                height: 24,
                                fit: BoxFit.fitHeight,
                              ),
                              if (widget.mode == 0) (
                                const SizedBox(width: 15,)
                              ),
                              if (widget.mode == 0) (
                                Text(
                                  context.t("Your Library"),
                                  style: TextStyle(
                                    fontFamily: "CircularSp",
                                    fontSize: 16,
                                    color: _mediaLibaryHovered ? focusedElementColor : unfocusedElementColor,
                                  ),
                                )
                              )
                            ],
                          ),
                        )
                      )
                    ),
                    if (widget.mode == 0) (
                      SizedBox(
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
                                  color: _addPlayListHovered ? hoveredBackgroundElementColor : Colors.transparent,
                                ),
                                child: Image.asset(
                                  addIconAsset,
                                  color: _addPlayListHovered ? focusedElementColor : unfocusedElementColor,
                                  colorBlendMode: BlendMode.modulate,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
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
                                  color: _zoomLibraryArrowHovered ? hoveredBackgroundElementColor : Colors.transparent,
                                ),
                                child: Image.asset(
                                  arrowIconAsset,
                                  color: _zoomLibraryArrowHovered ? focusedElementColor : unfocusedElementColor,
                                  colorBlendMode: BlendMode.modulate,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20,),
                          ],
                        ),
                      )
                    )
                  ],
                ),
              ),
              if (widget.mode == 0) (
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7, right: 7, top: 10),
                    child: Container(
                      decoration: globalInfoContainerDecoration,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 23, right: 20, bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.t("Create your first playlist"),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'CircularSp',
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              context.t("It's easy, we'll help you"),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'CircularSp-Book'
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomWhiteElevatedButtonComponent(
                              elevatedButtonText: Text(context.t("New Playlist"), style: const TextStyle(fontFamily: 'CircularSp'),)
                            )
                          ],
                        ),
                      )
                    ),
                  ),
                )
              ),
              if (widget.mode == 0) (
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7, right: 7, top: 24),
                    child: Container(
                      decoration: globalInfoContainerDecoration,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 23, right: 20, bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.t("Let's find some podcasts to follow"),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'CircularSp',
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              context.t("We'll keep you updated on new episodes"),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'CircularSp-Book'
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomWhiteElevatedButtonComponent(
                              elevatedButtonText: Text(context.t("Browse podcasts"), style: const TextStyle(fontFamily: 'CircularSp'),)
                            )
                          ],
                        ),
                      )
                    ),
                  ),
                )
              ),
              if (widget.mode == 1) (
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
                      color: _addPlayListHovered ? hoveredBackgroundElementColor : Colors.transparent,
                    ),
                    child: Image.asset(
                      addIconAsset,
                      color: _addPlayListHovered ? focusedElementColor : unfocusedElementColor,
                      colorBlendMode: BlendMode.modulate,
                    ),
                  ),
                )
              )
          ],
        )
      )
    );
  }
}