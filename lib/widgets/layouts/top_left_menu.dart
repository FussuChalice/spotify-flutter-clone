import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets.dart';
import 'package:gettext_i18n/gettext_i18n.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/widgets/shell.dart';

class TopLeftMenuLayout extends StatefulWidget {
  
  const TopLeftMenuLayout({Key? key, required this.mode}) : super(key: key);

  final int mode;

  @override
  State<TopLeftMenuLayout> createState() => _TopLeftMenuLayoutState();
}

class _TopLeftMenuLayoutState extends State<TopLeftMenuLayout> {
  String _selectedOption = "home";
  bool _homeHovered = false;
  bool _searchHovered = false;

  @override
  Widget build(BuildContext context) {
    return Shell(
      height: 112,
      child: Padding(
        padding: const EdgeInsets.only(left: 26, top: 10, bottom: 13),
        child: Column(
          children: [
            Expanded(
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _homeHovered = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _homeHovered = false;
                  });
                },
                child: GestureDetector(
                  onTap: () {
                    _updateSelectedOption("home");
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        _selectedOption == "home" ? homeFocusedIconAsset : homeUnfocusedIconAsset,
                        color: _selectedOption == "home" || _homeHovered ? focusedElementColor : unfocusedElementColor,
                        colorBlendMode: BlendMode.modulate,
                        height: 24,
                        fit: BoxFit.fitHeight,
                      ),
                      if (widget.mode == 0) (
                        const SizedBox(width: 23,)
                      ),
                      if (widget.mode == 0) (
                        Text(
                          context.t("Home"),
                          style: TextStyle(
                            color: _selectedOption == "home" || _homeHovered ? focusedElementColor : unfocusedElementColor,
                            fontFamily: 'CircularSp',
                            fontSize: 16
                          ),
                        )
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _searchHovered = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _searchHovered = false;
                  });
                },
                child: GestureDetector(
                  onTap: () {
                    _updateSelectedOption("search");
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        _selectedOption == "search" ? searchFocusedIconAsset : searchUnfocusedIconAsset,
                        color: _selectedOption == "search" || _searchHovered ? focusedElementColor : unfocusedElementColor,
                        colorBlendMode: BlendMode.modulate,
                        height: 24,
                        fit: BoxFit.fitHeight,
                      ),
                      if (widget.mode == 0) (
                        const SizedBox(width: 23,)
                      ),
                      if (widget.mode == 0) (
                        Text(
                          context.t("Search"),
                          style: TextStyle(
                            color: _selectedOption == "search" || _searchHovered ? focusedElementColor : unfocusedElementColor,
                            fontFamily: 'CircularSp',
                            fontSize: 16
                          ),
                        )
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

void _updateSelectedOption(String option) {
    setState(() {
      _selectedOption = option;
    });
  }
}