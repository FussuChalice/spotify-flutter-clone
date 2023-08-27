// colors.dart

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

/// The background color of the window.
const Color windowBackgroundColor = Color.fromRGBO(0, 0, 0, 1);

/// The primary shell color used for various UI elements.
const Color shellColor = Color.fromRGBO(18, 18, 18, 1);

/// The color of focused UI elements.
const Color focusedElementColor = Color.fromRGBO(255, 255, 255, 1);

/// The color of unfocused UI elements.
const Color unfocusedElementColor = Color.fromRGBO(189, 189, 189, 1);

/// The background color of UI elements when hovered.
const Color hoveredBackgroundElementColor = Color.fromRGBO(33, 33, 33, 1);

/// The color used for info boxes.
const Color infoBoxColor = Color.fromRGBO(36, 36, 36, 1);

/// The color of icons when clicked.
const Color clickedIconColor = Color.fromRGBO(28, 202, 90, 1);

/// The color of icons when clicked and hovered.
const Color clickedHoveredIconColor = Color.fromRGBO(33, 233, 103, 1);

/// Window button colors for various states.
final windowButtonColors = WindowButtonColors(
  iconNormal: Colors.white,
  mouseOver: const Color.fromARGB(255, 136, 136, 136),
  mouseDown: const Color.fromARGB(255, 73, 73, 73),
  iconMouseOver: Colors.white,
  iconMouseDown: const Color.fromARGB(255, 136, 136, 136),
);

/// Window close button colors for various states.
final windowCloseButtonColors = WindowButtonColors(
  mouseOver: const Color(0xFFD32F2F),
  mouseDown: const Color(0xFFB71C1C),
  iconNormal: Colors.white,
  iconMouseOver: Colors.white,
);