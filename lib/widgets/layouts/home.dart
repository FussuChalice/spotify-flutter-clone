import 'package:flutter/material.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/widgets/layouts/home_top_box.dart';
import 'package:spotify_flutter/widgets/shell.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return const Shell(
      backgroundGradient: LinearGradient(
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
          HomeTopBox(
            backgroundColor: Color(0xFF1d2320),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
        ],
      ),
    );
  }
}