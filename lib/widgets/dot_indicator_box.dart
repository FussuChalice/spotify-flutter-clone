import 'package:flutter/material.dart';

class DotIndicatorBox extends StatefulWidget {
  const DotIndicatorBox({
    super.key,
    required this.child,
    required this.clicked,
    required this.paddingToIndicator,
    required this.clickedColor,
    required this.paddingFromTop
  });

  final Widget child;
  final bool clicked;
  final double paddingToIndicator;
  final double paddingFromTop;
  final Color clickedColor;


  @override
  State<DotIndicatorBox> createState() => _DotIndicatorBoxState();
}

class _DotIndicatorBoxState extends State<DotIndicatorBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.paddingFromTop),
      child: Column(
        children: [
          widget.child,
          SizedBox(height: widget.paddingToIndicator,),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.clicked ? widget.clickedColor : Colors.transparent,
            ),
            width: 4,
            height: 4,
          )
        ],
      ),
    );
  }
}