import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final Function onPressed;
  final Widget icon;

  const AppIconButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed.call(), icon: icon);
  }
}
