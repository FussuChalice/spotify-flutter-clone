import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

const Color windowBackgroundColor = Color.fromRGBO(0, 0, 0, 1);
const Color componentWrapperColor = Color.fromRGBO(18, 18, 18, 1);
const Color focusedElementColor = Color.fromRGBO(255, 255, 255, 1);
const Color unfocusedElementColor = Color.fromRGBO(189, 189, 189, 1);
const Color hoveredBackgroundElementColor = Color.fromRGBO(33, 33, 33, 1);
const Color infoContainerColor = Color.fromRGBO(36, 36, 36, 1);
const Color clickedIconColor = Color.fromRGBO(28, 202, 90, 1);
const Color clickedHoveredIconColor = Color.fromRGBO(33, 233, 103, 1);

final windowButtonColors = WindowButtonColors(
    iconNormal: Colors.white,
    mouseOver: const Color.fromARGB(255, 136, 136, 136),
    mouseDown: const Color.fromARGB(255, 73, 73, 73),
    iconMouseOver: Colors.white,
    iconMouseDown: const Color.fromARGB(255, 136, 136, 136)
);

final windowCloseButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: Colors.white,
    iconMouseOver: Colors.white
);