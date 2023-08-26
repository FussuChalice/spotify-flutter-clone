import 'package:flutter/material.dart';
import 'package:spotify_flutter/assets.dart';
import 'package:spotify_flutter/colors.dart';
import 'package:spotify_flutter/utilites.dart';
import 'package:spotify_flutter/widgets/custom_circle_box.dart';
import 'package:spotify_flutter/widgets/white_elevated_button.dart';
import 'package:gettext_i18n/gettext_i18n.dart';

class HomeTopBox extends StatefulWidget {
  const HomeTopBox(
      {super.key, required this.borderRadius, required this.backgroundColor});

  final BorderRadius borderRadius;
  final Color backgroundColor;

  @override
  State<HomeTopBox> createState() => _HomeTopBoxState();
}

class _HomeTopBoxState extends State<HomeTopBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
          color: widget.backgroundColor, borderRadius: widget.borderRadius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomCircleBox(
                  width: 32,
                  height: 32,
                  backgroundColor: shellColor.withAlpha(210),
                  callback: () {},
                  child: Image.asset(
                    leftIconAsset,
                    colorBlendMode: BlendMode.modulate,
                    height: 16,
                    width: 16,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                CustomCircleBox(
                  width: 32,
                  height: 32,
                  backgroundColor: shellColor.withAlpha(240),
                  callback: () {},
                  child: Image.asset(
                    rightIconAsset,
                    colorBlendMode: BlendMode.modulate,
                    height: 16,
                    width: 16,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 23),
              child: Row(
                children: [
                  WhiteElevatedButton(
                    elevatedButtonText: Text(
                        context.t("Learn more about Premium"),
                        style: const TextStyle(fontFamily: 'CircularSp')),
                    callback: () async {
                      await utilLaunchUrl(
                          Uri.parse("https://www.spotify.com/premium/"));
                    },
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  CustomCircleBox(
                    width: 32,
                    height: 32,
                    backgroundColor: shellColor.withAlpha(240),
                    callback: () {},
                    child: Image.asset(
                      personIconAsset,
                      colorBlendMode: BlendMode.modulate,
                      height: 16,
                      width: 16,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
