import 'package:flutter/material.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/font_controller.dart';
import 'package:spotify_flutter/fonts.dart';
import 'package:spotify_flutter/widgets/album_card.dart';
import 'package:spotify_flutter/widgets/home_delimiter.dart';
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
    FontController fontController =
        FontController(context.t("Home"), latinFonts, cyrillicFonts);

    FontList currentFontList = fontController.getFontList();

    return Shell(
      backgroundGradient: const LinearGradient(
        colors: [Color(0xFF1d2320), shellColor],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 0.5],
      ),
      child: Column(
        children: [
          const HomeTopBox(
            backgroundColor: Color(0xFF1d2320),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: Text(
                      context.t("Good evening"),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: currentFontList.bold,
                      ),
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          AlbumCard(
                              albumTitle: "Камнем по голове",
                              albumImageURL:
                                  "https://i.scdn.co/image/ab67616d0000b2730c3b892ae60740e164855765"),
                          AlbumCard(
                              albumTitle: "Король и Шут",
                              albumImageURL:
                                  "https://i.scdn.co/image/ab6761610000e5eb8581bbea73df6ff1812ceb48"),
                        ],
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          AlbumCard(
                              albumTitle: "Кино",
                              albumImageURL:
                                  "https://i.scdn.co/image/ab676161000051740f9e913afb90d4b58b6e8ebb"),
                          AlbumCard(
                              albumTitle: "Океан Ельзи",
                              albumImageURL:
                                  "https://i.scdn.co/image/ab6761610000517474dc4165fcbf068a5a9ede6f"),
                        ],
                      ),
                    )),
                  ],
                ),
                const SizedBox(height: 30,),
                HomeDelimiter(
                  headerText: "Популярно у слушателей: Короче, история", 
                  showButtonText: "Показать все", 
                  callback: () {}
                )
              ],
            ),
          )))
        ],
      ),
    );
  }
}
