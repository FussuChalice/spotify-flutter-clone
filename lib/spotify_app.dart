import 'package:spotify_flutter/assets.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/widgets/layouts/home.dart';
import 'package:spotify_flutter/widgets/layouts/media_library.dart';
import 'package:spotify_flutter/widgets/layouts/player_bottom.dart';
import 'package:spotify_flutter/widgets/layouts/right_sidebar.dart';
import 'package:spotify_flutter/widgets/layouts/top_left_menu.dart';
import 'package:gettext_i18n/gettext_i18n.dart';
import 'package:spotify_flutter/widgets/window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:spotify_flutter/providers.dart';


import 'package:flutter_localizations/flutter_localizations.dart';

const borderColor = Color.fromARGB(0, 255, 255, 255);

class SpotifyApp extends StatefulWidget {
  const SpotifyApp({super.key});

  @override
  State<SpotifyApp> createState() => _SpotifyAppState();
}

class _SpotifyAppState extends State<SpotifyApp> {

  double leftPanelWidth = 1.0;

  @override

  Widget build(BuildContext context) {
    final menuModeProvider = Provider.of<MenuModeProvider>(context);
    final int menuMode = menuModeProvider.menuMode;

    return MaterialApp(
      // App localization
      supportedLocales: const [Locale('en'), Locale('ja'), Locale('ru')],
      localizationsDelegates: [
        GettextLocalizationsDelegate(defaultLanguage: 'en'),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      

      debugShowCheckedModeBanner: false,
      home: Window(
        backgroundColor: windowBackgroundColor, 
        borderColor: borderColor,
        windowTitleBarButton: GestureDetector(
              onTap: () {
                showAppMenu(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10.0),
                child: Image.asset(
                  dotsIconAsset,
                  fit: BoxFit.cover,
                  width: 20.0,
                  height: 15.0,
                ),
              ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 7, right: 7, top: 10),
          child: Row(
            children: [
              if (menuMode == 0) (
                const Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      TopLeftMenuLayout(mode: 0,),
                      SizedBox(height: 7,),
                      MediaLibraryLayout(
                        mode: 0, 
                      ),
                    ],
                  ),
                )
              ) else (
                const SizedBox(
                  width: 72,
                  child: Column(
                    children: [
                      TopLeftMenuLayout(mode: 1,),
                      SizedBox(height: 7,),
                      MediaLibraryLayout(mode: 1,),
                    ],
                  ),
                )
              ),
              const SizedBox(width: 7,),
              const Expanded(
                flex: 2, 
                child: HomeLayout(),
              ),
              const SizedBox(width: 7,),
              Expanded(
                flex: 1,
                child: rightSidebarLayout,
              ),
            ],
          ),
        ),
        windowBottom: const PlayerBottomLayout(),
        ),
      );
    }
  }



void showAppMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset offset = button.localToGlobal(Offset.zero);

    // Show the menu at the button's position
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy + button.size.height, offset.dx + button.size.width, offset.dy),
      items: [
        const PopupMenuItem(
          value: 'file',
          child: Text('Файл'),
        ),
        const PopupMenuItem(
          value: 'saveAs',
          child: Text('Сохранить как'),
        ),
        const PopupMenuItem(
          value: 'about',
          child: Text('О программе'),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      // Handle the selected menu item here
      if (value == 'file') {
        // Handle "Файл" menu item
      } else if (value == 'saveAs') {
        // Handle "Сохранить как" menu item
      } else if (value == 'about') {
        // Handle "О программе" menu item
      }
    });
}
