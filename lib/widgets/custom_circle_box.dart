import 'package:flutter/material.dart';

typedef CustomCircleBoxCallback = void Function();

class CustomCircleBox extends StatefulWidget {
  const CustomCircleBox(
      {super.key,
      this.width = 30,
      this.height = 30,
      this.padding = const EdgeInsets.all(7.0),
      this.backgroundColor = Colors.red,
      required this.callback,
      required this.child});

  final double width, height;
  final Widget child;
  final EdgeInsets padding;
  final Color backgroundColor;
  final CustomCircleBoxCallback callback;

  @override
  State<CustomCircleBox> createState() => _CustomCircleBoxState();
}

class _CustomCircleBoxState extends State<CustomCircleBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callback,
      child: Container(
        alignment: Alignment.center,
        width: widget.width,
        height: widget.height,
        padding: widget.padding,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          shape: BoxShape.circle,
        ),
        child: widget.child,
      ),
    );
  }
}
