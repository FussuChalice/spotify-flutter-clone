import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomWhiteElevatedButtonComponent extends StatefulWidget {
  const CustomWhiteElevatedButtonComponent({super.key, required this.elevatedButtonText});

  final Text elevatedButtonText;

  @override
  State<CustomWhiteElevatedButtonComponent> createState() => _CustomWhiteElevatedButtonComponentState();
}

class _CustomWhiteElevatedButtonComponentState extends State<CustomWhiteElevatedButtonComponent> {
  bool _addPlayListWhiteButtonHovered = false;
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _addPlayListWhiteButtonHovered = true),
      onExit: (event) => setState(() => _addPlayListWhiteButtonHovered = false),
      child: SizedBox(
        height: 32,
        child: ElevatedButton(
          onPressed: () {
            // Do something when the button is pressed
          },
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