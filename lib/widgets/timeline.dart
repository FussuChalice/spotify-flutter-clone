import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_flutter/providers.dart';

class Timeline extends StatefulWidget {
  const Timeline({super.key});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    // final trackTimeProvider = Provider.of<TrackTimeProvider>(context);
    // Duration trackTimeLength = trackTimeProvider.trackTimeLength;
    // Duration currentTrackTime = trackTimeProvider.currentTrackTime;

    return Container(
      color: Colors.red,
      width: 20,
      height: 10,
    );
  }
}