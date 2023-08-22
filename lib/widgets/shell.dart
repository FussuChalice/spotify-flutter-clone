import 'package:flutter/material.dart';
import 'package:spotify_flutter/colors.dart';

class Shell extends StatefulWidget {
  const Shell({
    super.key,
    required this.child,
    this.height,
    this.width
  });

  final Widget child;
  final double? width, height;

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: shellColor,
        borderRadius: BorderRadius.circular(10)
      ),
      width: widget.width,
      height: widget.height,
      child: widget.child,
    );
  }
}