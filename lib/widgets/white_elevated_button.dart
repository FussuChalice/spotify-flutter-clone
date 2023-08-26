import 'package:flutter/material.dart';

typedef WhiteElevatedButtonCallback = void Function();

class WhiteElevatedButton extends StatefulWidget {
  const WhiteElevatedButton({super.key, required this.elevatedButtonText, required this.callback});

  final Text elevatedButtonText;
  final WhiteElevatedButtonCallback callback;

  @override
  State<WhiteElevatedButton> createState() => _CustomWhiteElevatedButtonState();
}

class _CustomWhiteElevatedButtonState extends State<WhiteElevatedButton> {
  bool _addPlayListWhiteButtonHovered = false;
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _addPlayListWhiteButtonHovered = true),
      onExit: (event) => setState(() => _addPlayListWhiteButtonHovered = false),
      child: SizedBox(
        height: 32,
        child: ElevatedButton(
          onPressed: widget.callback,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) {
                if (states.contains(MaterialState.hovered) || _addPlayListWhiteButtonHovered) {
                  return Colors.grey.shade300; // Background color when hovered
                }
                return Colors.white; // Default background color
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // Adjust the corner radius as needed
              ),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Text color
          ),
          child: widget.elevatedButtonText
        ),
      )
    );
  }
}