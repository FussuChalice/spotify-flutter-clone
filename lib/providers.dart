import 'package:flutter/material.dart';

class MenuModeProvider extends ChangeNotifier {
  int _menuMode = 0;

  int get menuMode => _menuMode;

  void setMenuMode(int mode) {
    _menuMode = mode;
    notifyListeners();
  }
}


class TrackTimeProvider extends ChangeNotifier {
  Duration _trackTimeLength = const Duration(minutes: 0, seconds: 0);
  Duration _currentTrackTime = const Duration(minutes: 0, seconds: 0);

  Duration get trackTimeLength => _trackTimeLength;
  Duration get currentTrackTime => _currentTrackTime;

  void setTrackTimeLength(Duration trackTimeLength) {
    _trackTimeLength = trackTimeLength;
    notifyListeners();
  }

  void setCurrentTrackTime(Duration currentTrackTime) {
    _currentTrackTime = currentTrackTime;
    notifyListeners();
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}