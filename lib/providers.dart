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
  Duration _trackTimeLength = Duration.zero;
  Duration _currentTrackTime = Duration.zero;

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
}