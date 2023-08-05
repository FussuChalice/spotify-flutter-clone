import 'package:flutter/material.dart';

typedef IconButtonCallback = void Function();

class CustomIconButtonComponent extends StatefulWidget {
  const CustomIconButtonComponent({
    Key? key,
    required this.iconPath,
    required this.iconButtonOnTapFunction, 
    required this.focusedColor, 
    required this.unfocusedColor,
    required this.iconButtonHoverFunction,
    required this.iconHeight,
    required this.blendMode
  }) : super(key: key);

  final String iconPath;
  final Color focusedColor;
  final Color unfocusedColor;
  final double iconHeight;
  final BlendMode blendMode;
  final IconButtonCallback iconButtonOnTapFunction;
  final IconButtonCallback iconButtonHoverFunction;

  @override
  State<CustomIconButtonComponent> createState() => _CustomIconButtonComponentState();
}

class _CustomIconButtonComponentState extends State<CustomIconButtonComponent> {
  bool _buttonHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _buttonHovered = true;
        });
        widget.iconButtonHoverFunction();
      },
      onExit: (event) {
        setState(() {
          _buttonHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.iconButtonOnTapFunction,
        child: Image.asset(
          widget.iconPath,
          color: _buttonHovered ? widget.focusedColor : widget.unfocusedColor,
          colorBlendMode: widget.blendMode,
          height: widget.iconHeight,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}