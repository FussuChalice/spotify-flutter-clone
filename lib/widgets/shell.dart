import 'package:flutter/material.dart';
import 'package:spotify_flutter/colors.dart';

class Shell extends StatefulWidget {
  const Shell({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.backgroundColor = shellColor,
    this.backgroundGradient
  });

  final Widget child;
  final double? width, height;
  final Color backgroundColor;
  final Gradient? backgroundGradient;

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        gradient: widget.backgroundGradient,
        borderRadius: BorderRadius.circular(10)
      ),
      width: widget.width,
      height: widget.height,
      child: widget.child,
    );
  }
}