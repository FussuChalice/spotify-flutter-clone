import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:spotify_flutter/colors.dart';

class Window extends StatefulWidget {
  const Window({
    super.key,
    required this.backgroundColor,
    required this.borderColor,
    required this.body,
    required this.windowTitleBarButton,
    required this.windowBottom,
  });

  final Color backgroundColor, borderColor;
  final Widget body, windowTitleBarButton, windowBottom;

  @override
  State<Window> createState() => _WindowState();
}

class _WindowState extends State<Window> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: WindowBorder(
              color: widget.borderColor,
              width: 1,
              child: Column(
                children: [
                  WindowTitleBar(
                    windowTitleBarButton: widget.windowTitleBarButton,
                  ),
                  Expanded(
                    child: widget.body,
                  ),
                  widget.windowBottom
                ]
            )
        ),
    );
  }
}

class WindowTitleBar extends StatelessWidget {

  const WindowTitleBar({Key? key, required this.windowTitleBarButton}) : super(key: key);

  final Widget windowTitleBarButton;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: windowBackgroundColor,
      child: WindowTitleBarBox(
        child: Row(
          children: [
            windowTitleBarButton,
            Expanded(child: MoveWindow()), 
            const WindowButtons(),
          ],
        ),
      ),
    );
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: windowButtonColors),
        MaximizeWindowButton(colors: windowButtonColors),
        CloseWindowButton(colors: windowCloseButtonColors),
      ],
    );
  }
}
