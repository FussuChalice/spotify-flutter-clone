import 'package:flutter/material.dart';

typedef PlayerButtonCallback = void Function();

class PlayerButton extends StatefulWidget {
  const PlayerButton({
    super.key, 
    required this.startFunction, 
    required this.stopFunction, 
    required this.buttonIsClicked, 
    required this.playerButtonColor, 
    required this.playerButtonHoveredColor,
    required this.height,
    required this.width,
    required this.startPlayerButtonIconPath,
    required this.stopPlayerButtonIconPath
  });

  final PlayerButtonCallback startFunction;
  final PlayerButtonCallback stopFunction;
  final bool buttonIsClicked;
  final Color playerButtonColor;
  final Color playerButtonHoveredColor;
  final double width;
  final double height;
  final String startPlayerButtonIconPath;
  final String stopPlayerButtonIconPath;

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
          height: widget.height,
          width: widget.width,
          child: Padding(
            padding: const EdgeInsets.all(7.0), // Adjust the padding as needed
            child: Image.asset(
              widget.buttonIsClicked ? widget.stopPlayerButtonIconPath : widget.startPlayerButtonIconPath,
              height: 16,
              fit: BoxFit.fitHeight, // Maintain aspect ratio and fit inside the padding
            ),
          ),
        ),
      ),
    );
  }
}