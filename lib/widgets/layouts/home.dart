import 'package:flutter/material.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/font_controller.dart';
import 'package:spotify_flutter/fonts.dart';
import 'package:spotify_flutter/widgets/album_card.dart';
import 'package:spotify_flutter/widgets/layouts/home_top_box.dart';
import 'package:spotify_flutter/widgets/shell.dart';
import 'package:gettext_i18n/gettext_i18n.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    FontController fontController = FontController(
      context.t("Home"),
      latinFonts,
      cyrillicFonts
    );

    FontList currentFontList = fontController.getFontList();

    return Shell(
      backgroundGradient: const LinearGradient(
        colors: [
          Color(0xFF1d2320), 
          shellColor
        ], 
        begin: Alignment.topCenter, 
        end: Alignment.bottomCenter,
        stops: [0.0, 0.5],
      ),
      child: Column(
        children: [
          const HomeTopBox(
            backgroundColor: Color(0xFF1d2320),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Expanded(
              ),
            ),
          )
        ],
      ),
    );
  }
}