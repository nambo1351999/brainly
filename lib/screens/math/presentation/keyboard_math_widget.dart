import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';

class KeyboardMathWidget extends StatefulWidget {
  const KeyboardMathWidget({super.key});

  @override
  State<KeyboardMathWidget> createState() => _KeyboardMathWidgetState();
}

class _KeyboardMathWidgetState extends State<KeyboardMathWidget> {
  late final _controller = MathFieldEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapClear() {
    final mathExpression = TeXParser(_controller.currentEditingValue()).parse();
    final texNode = convertMathExpressionToTeXNode(mathExpression);
    final texString = texNode.buildTeXString();

    print("NAMMMMMMMMMMMMMMMMMMMM${texNode}    ${texString}");
    _controller.clear();

  }

  @override
  Widget build(BuildContext context) {
    return MathField(
      controller: _controller,
      onChanged: (value) {
        String expression;
        try {
          expression = '${TeXParser(value).parse()}';
        } catch (_) {
          expression = 'invalid input';
        }

        print('input expression: $value\n'
            'converted expression: $expression');
      },

      onSubmitted: (text) {
        print('input expression: ${text}');
      },
      decoration: InputDecoration(
        suffix: MouseRegion(
          cursor: MouseCursor.defer,
          child: GestureDetector(
            onTap: _onTapClear,
            child: const Icon(
              Icons.highlight_remove_rounded,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
