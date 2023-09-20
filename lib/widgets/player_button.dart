import 'package:flutter/material.dart';

typedef PlayerButtonCallback = void Function();

class PlayerButton extends StatefulWidget {
  const PlayerButton({
    Key? key,
    required this.startFunction,
    required this.stopFunction,
    required this.buttonIsClicked,
    required this.playerButtonColor,
    required this.playerButtonHoveredColor,
    required this.iconSize,
    required this.imageSize,
    required this.startPlayerButtonIconPath,
    required this.stopPlayerButtonIconPath,
    this.padding = const EdgeInsets.all(7.0), // Add a default value for padding
  }) : super(key: key);

  final PlayerButtonCallback startFunction;
  final PlayerButtonCallback stopFunction;
  final bool buttonIsClicked;
  final Color playerButtonColor;
  final Color playerButtonHoveredColor;
  final double iconSize;
  final double imageSize;
  final String startPlayerButtonIconPath;
  final String stopPlayerButtonIconPath;
  final EdgeInsetsGeometry padding; // Add the padding property

  @override
  State<PlayerButton> createState() => _PlayerButtonState();
}

class _PlayerButtonState extends State<PlayerButton> {
  bool _buttonHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _buttonHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _buttonHovered = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.buttonIsClicked ? widget.stopFunction : widget.startFunction,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _buttonHovered ? widget.playerButtonHoveredColor : widget.playerButtonColor,
          ),
          height: widget.iconSize,
          width: widget.iconSize,
          child: Padding(
            padding: widget.padding, // Use the specified padding
            child: Image.asset(
              widget.buttonIsClicked ? widget.stopPlayerButtonIconPath : widget.startPlayerButtonIconPath,
              height: widget.imageSize,
              width: widget.imageSize,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}