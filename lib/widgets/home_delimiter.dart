import 'package:flutter/material.dart';
import 'package:gettext_i18n/gettext_i18n.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/font_controller.dart';
import 'package:spotify_flutter/fonts.dart';

typedef HomeDelimiterCallback = void Function();

class HomeDelimiter extends StatefulWidget {
  const HomeDelimiter(
      {super.key,
      required this.headerText,
      required this.showButtonText,
      required this.callback});

  final String headerText, showButtonText;
  final HomeDelimiterCallback callback;

  @override
  State<HomeDelimiter> createState() => _HomeDelimiterState();
}

class _HomeDelimiterState extends State<HomeDelimiter> {
  bool _headerTextHovered = false;
  bool _showButtonTextHovered = false;

  @override
  Widget build(BuildContext context) {
    FontController fontController =
        FontController(context.t("Home"), latinFonts, cyrillicFonts);

    FontList currentFontList = fontController.getFontList();

    return SizedBox(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
                child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (event) {
                setState(() {
                  _headerTextHovered = true;
                });
              },
              onExit: (event) {
                setState(() {
                  _headerTextHovered = false;
                });
              },
              child: Text(
                widget.headerText,
                style: TextStyle(
                    fontFamily: currentFontList.bold,
                    fontSize: 24,
                    color: Colors.white,
                    decoration: _headerTextHovered
                        ? TextDecoration.underline
                        : TextDecoration.none),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
            )),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
                child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (event) {
                setState(() {
                  _showButtonTextHovered = true;
                });
              },
              onExit: (event) {
                setState(() {
                  _showButtonTextHovered = false;
                });
              },
              child: Text(
                widget.showButtonText,
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontFamily: currentFontList.bold,
                    fontSize: 14,
                    color: unfocusedElementColor,
                    decoration: _showButtonTextHovered
                        ? TextDecoration.underline
                        : TextDecoration.none),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
            ))
          ],
        ));
  }
}
