import 'package:brainly/screens/math/presentation/camera_math_widget.dart';
import 'package:brainly/screens/math/presentation/draw_math_widget.dart';
import 'package:brainly/screens/math/presentation/keyboard_math_widget.dart';
import 'package:brainly/screens/math/providers/math_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MathPage extends StatefulWidget {
  const MathPage({super.key});

  @override
  State<MathPage> createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MathModel>(builder: (context, model, child) {
      switch (model.tableMath) {
        case TabMathState.camera:
          return const CameraMathWidget();
        case TabMathState.draw:
          return const DrawMathWidget();
        case TabMathState.keyboard:
          return const KeyboardMathWidget();
      }
      return Container();
    });
  }

}
