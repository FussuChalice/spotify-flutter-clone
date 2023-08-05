import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:spotify_flutter/assets.dart';
import 'package:spotify_flutter/components/containers/home_component.dart';
import 'package:spotify_flutter/components/containers/media_library_component.dart';
import 'package:spotify_flutter/components/containers/player_component.dart';
import 'package:spotify_flutter/components/containers/right_sidebar_component.dart';
import 'package:spotify_flutter/components/containers/top_left_menu_component.dart';
import 'package:spotify_flutter/styles/colors.dart';
import 'package:gettext_i18n/gettext_i18n.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MenuModeProvider>(
      create: (context) => MenuModeProvider(),
      child: const MyApp(),
    ),
  );

  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(1280, 720);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Spotify";
    win.show();
  });
}

class MenuModeProvider extends ChangeNotifier {
  int _menuMode = 0;

  int get menuMode => _menuMode;

  void setMenuMode(int mode) {
    _menuMode = mode;
    notifyListeners();
  }
}

const borderColor = Color.fromARGB(0, 255, 255, 255);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  double leftPanelWidth = 1.0;

  @override

  Widget build(BuildContext context) {
    final menuModeProvider = Provider.of<MenuModeProvider>(context);
    final int menuMode = menuModeProvider.menuMode;

    return MaterialApp(
      // App localization
      supportedLocales: ['en','ja','ru'].map((l) => Locale(l)),
      localizationsDelegates: [
        GettextLocalizationsDelegate(defaultLanguage: 'en'),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: windowBackgroundColor,
        body: 
            WindowBorder(
              color: borderColor,
              width: 1,
              child: Column(
                children: [
                  const WindowTitleBar(),

                  // Body Expanded | Write elements there
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 7, right: 7, top: 10),
                            child: Row(
                              children: [
                                if (menuMode == 0) (
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: const [
                                        TopLeftMenuComponent(mode: 0,),
                                        SizedBox(height: 7,),
                                        MediaLibraryComponent(
                                          mode: 0, 
                                        ),
                                      ],
                                    ),
                                  )
                                ) else (
                                  SizedBox(
                                    width: 72,
                                    child: Column(
                                      children: const [
                                        TopLeftMenuComponent(mode: 1,),
                                        SizedBox(height: 7,),
                                        MediaLibraryComponent(mode: 1,),
                                      ],
                                    ),
                                  )
                                ),
                                const SizedBox(width: 7,),
                                Expanded(
                                  flex: 2, 
                                  child: homeComponent
                                ),
                                const SizedBox(width: 7,),
                                Expanded(
                                  flex: 1,
                                  child: rightSidebarComponent,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const PlayerComponent(),
                      ],
                    )
                  )
                ], 
              ),
            ),
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

class WindowTitleBar extends StatelessWidget {

  const WindowTitleBar({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: windowBackgroundColor,
      child: WindowTitleBarBox(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                showAppMenu(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10.0), // Add padding here
                child: Image.asset(
                  dotsIconAsset,
                  fit: BoxFit.cover,
                  width: 20.0,
                  height: 15.0,
                ),
              ),
            ),
            Expanded(child: MoveWindow()), 
            const WindowButtons(),
          ],
        ),
      ),
    );
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: windowButtonColors),
        MaximizeWindowButton(colors: windowButtonColors),
        CloseWindowButton(colors: windowCloseButtonColors),
      ],
    );
  }
}


