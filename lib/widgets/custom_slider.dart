import 'package:flutter/material.dart';
import 'package:spotify_flutter/colors.dart';

class CustomSlider extends StatefulWidget {
  final Duration startValue;
  final Duration endValue;
  final Duration currentValue;
  final ValueChanged<Duration>? onChanged;
  final double width;

  const CustomSlider({
    Key? key,
    required this.startValue,
    required this.endValue,
    required this.currentValue,
    this.width = 200,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _hovered = false;
        });
      },
      child: SizedBox(
        width: widget.width,
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 4,
            thumbColor: Colors.white,
            activeTrackColor: _hovered ? clickedIconColor : Colors.white,
            inactiveTrackColor: Colors.white,
            overlayColor: Colors.transparent,
            thumbShape: _hovered
                ? const RoundSliderThumbShape(enabledThumbRadius: 6)
                : const RoundSliderThumbShape(enabledThumbRadius: 0),
            trackShape: CustomTrackShape(_hovered),
            valueIndicatorShape: SliderComponentShape.noOverlay,
          ),
          child: Slider(
            value: _durationToDouble(widget.currentValue),
            min: _durationToDouble(widget.startValue),
            max: _durationToDouble(widget.endValue),
            onChanged: widget.onChanged != null
                ? (newValue) {
                    final newDurationValue = _doubleToDuration(newValue);
                    widget.onChanged!(newDurationValue);
                  }
                : null,
          ),
        ),
      ),
    );
  }

  double _durationToDouble(Duration duration) {
    return duration.inSeconds.toDouble();
  }

  Duration _doubleToDuration(double value) {
    return Duration(seconds: value.toInt());
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  final bool hovered; // Add a boolean property to receive _hovered value

  CustomTrackShape(this.hovered); // Constructor to initialize hovered

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 0,
    double additionalInactiveTrackHeight = 0,
  }) {
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
    );

    final Paint inactivePaint = Paint()
      ..color = infoBoxColor;

    // Draw the inactive track
    context.canvas.drawRRect(
      RRect.fromRectAndRadius(trackRect, Radius.circular(2)),
      inactivePaint,
    );

    // Draw the active track
    if (isEnabled) {
      final double trackLength = trackRect.width;
      final double thumbRadius = sliderTheme.thumbShape!.getPreferredSize(isEnabled, isDiscrete).width / 2;

      final activeTrackRect = Rect.fromLTRB(trackRect.left, trackRect.top, thumbCenter.dx - thumbRadius, trackRect.bottom);

      final Paint activePaint = Paint()
        ..color = hovered ? clickedIconColor : Colors.white;

      context.canvas.drawRRect(
        RRect.fromRectAndRadius(activeTrackRect, Radius.circular(5)),
        activePaint,
      );
    }
  }
}