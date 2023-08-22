import 'package:flutter/material.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/widgets/white_elevated_button.dart';

class InfoBox extends StatefulWidget {
  const InfoBox({
    super.key,
    required this.headerText,
    required this.paragraphText,
    required this.button
  });

  final String headerText, paragraphText;
  final WhiteElevatedButton button;

  @override
  State<InfoBox> createState() => _InfoBoxState();
}

class _InfoBoxState extends State<InfoBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: infoBoxColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 23, right: 20, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.headerText,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'CircularSp',
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              widget.paragraphText,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'CircularSp-Book'
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            widget.button,
          ],
        ),
      )
    );
  }
}