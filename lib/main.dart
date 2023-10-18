import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:spotify_flutter/config.dart';
import 'package:spotify_flutter/oauth.dart';

import 'package:spotify_flutter/providers.dart';
import 'package:spotify_flutter/spotify_app.dart';


void main() async{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuModeProvider>(
          create: (context) => MenuModeProvider(),
        ),
        ChangeNotifierProvider<TrackTimeProvider>(
          create: (context) => TrackTimeProvider(),
        ),
      ],
      child: const SpotifyApp(),
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

  await Hive.initFlutter();
  var settingsBox = await Hive.openBox('settings');

  if (!settingsBox.containsKey('userAuth')) {
    SpotifyOAuth oauth = SpotifyOAuth(CLIENT_ID, 3030, CLIENT_SECRET);
    oauth.init();
  }
}
