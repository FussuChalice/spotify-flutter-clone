import 'package:flutter/material.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/font_controller.dart';
import 'package:spotify_flutter/fonts.dart';
import 'package:spotify_flutter/network/network_loader.dart';
import 'package:spotify_flutter/widgets/album_card.dart';
import 'package:spotify_flutter/widgets/home_delimiter.dart';
import 'package:spotify_flutter/widgets/layouts/home_top_box.dart';
import 'package:spotify_flutter/widgets/sections_card.dart';
import 'package:spotify_flutter/widgets/shell.dart';
import 'package:gettext_i18n/gettext_i18n.dart';

import 'package:spotify_flutter/static.dart' as static_net_data;
import 'package:spotify_flutter/network/models/album.dart' as album_model;
// import 'package:spotify_flutter/network/models/artist.dart' as artist_model;

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late List<Future<album_model.Album>> firstAlbumCouple;
  late List<Future<album_model.Album>> secondAlbumCouple;
  // late List<Future<artist_model.Artist>> artists;

  NetworkLoader networkLoader = NetworkLoader(
    {"Authorization": "Bearer  BQBLKy19sddUjCfGJYEUU9NnhU0as6d7e-qt3g0W026R7m9HmUq-DG8D7a4LcgtOMCbEZk2j_Utp5-5DPNX7WTcCrgwuv8oWoLvStpR7fq4C1OBhx2U"}
  );

  @override
  void initState() {
    super.initState();

    List<Future<album_model.Album>> preloadedFirstAlbumCouple = [];
    List<Future<album_model.Album>> preloadedSecondAlbumCouple = [];
    // List<Future<artist_model.Artist>> preloadedArtists = [];

    for (int i = 0; i < 2; i++) 
    {preloadedFirstAlbumCouple.add(networkLoader.fetchAlbum(static_net_data.ALBUM_LOAD_IDS[i]));}

    for (int i = 2; i < 4; i++) 
    {preloadedSecondAlbumCouple.add(networkLoader.fetchAlbum(static_net_data.ALBUM_LOAD_IDS[i]));}

    firstAlbumCouple = preloadedFirstAlbumCouple;
    secondAlbumCouple = preloadedSecondAlbumCouple;

    // for (var id in static_net_data.ARTISTS_LOAD_IDS) {
    //   preloadedArtists.add(networkLoader.fetchArtist(id)); 
    // }
  }


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
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: FutureBuilder<List<album_model.Album>>(
                        future: Future.wait(firstAlbumCouple),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<album_model.Album> futureAlbumList = snapshot.data ?? [];

                            return Column(
                              children: futureAlbumList.map((album) {
                                return AlbumCard(
                                  albumTitle: album.name ?? "Album Name", 
                                  albumImageURL: album.images?[0].url ?? "Album image", 
                                  callback: () {}
                                );
                              }).toList(),
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }

                          return const SizedBox(height: 74,);
                        },
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: FutureBuilder<List<album_model.Album>>(
                        future: Future.wait(secondAlbumCouple),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<album_model.Album> futureAlbumList = snapshot.data ?? [];

                            return Column(
                              children: futureAlbumList.map((album) {
                                return AlbumCard(
                                  albumTitle: album.name ?? "Album Name", 
                                  albumImageURL: album.images?[0].url ?? "Album image", 
                                  callback: () {}
                                );
                              }).toList(),
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }

                          return const SizedBox(height: 74,);
                        },
                      ),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                HomeDelimiter(
                    headerText: "Популярно у слушателей: Короче, история",
                    showButtonText: "Показать все",
                    callback: () {}),
                Row(
                  children: [
                    SectionCard(
                      roundImage: false,
                      showPlayerButton: true,
                      mainImageURL: "https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228", 
                      headerText: "«Доступная история»", 
                      paragraphText: "Ярослав", 
                      callback: () {}
                    ),
                    const SizedBox(width: 16,),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                HomeDelimiter(
                  headerText: "Любимие исполнители",
                  showButtonText: "Показать все",
                  callback: () {}),
                Row(
                  children: [
                    SectionCard(
                      roundImage: true,
                      showPlayerButton: true,
                      mainImageURL: "https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228", 
                      headerText: "ДДТ", 
                      paragraphText: "Исполнитель", 
                      callback: () {}
                    ),
                    const SizedBox(width: 16,),
                    SectionCard(
                      roundImage: true,
                      showPlayerButton: true,
                      mainImageURL: "https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228", 
                      headerText: "Земфира", 
                      paragraphText: "Исполнитель", 
                      callback: () {}
                    ),
                    const SizedBox(width: 16,),
                    SectionCard(
                      roundImage: true,
                      showPlayerButton: true,
                      mainImageURL: "https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228", 
                      headerText: "AC/DC", 
                      paragraphText: "Исполнитель", 
                      callback: () {}
                    ),
                    const SizedBox(width: 16,),
                    SectionCard(
                      roundImage: true,
                      showPlayerButton: true,
                      mainImageURL: "https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228", 
                      headerText: "Король и Шут", 
                      paragraphText: "Исполнитель", 
                      callback: () {}
                    ),
                    const SizedBox(width: 16,),
                  ],
                ),
              ],
            ),
          )))
        ],
      ),
    );
  }
}
