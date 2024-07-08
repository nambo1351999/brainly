import 'package:brainly/components/app_text_field.dart';
import 'package:brainly/screens/translate/model/translate_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/app_icon_button.dart';
import '../../../components/app_ink_well.dart';

class TranslatePage extends StatefulWidget {
  const TranslatePage({super.key});

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TranslateModel>(builder: (context, model, child) {
      return Column(
        children: [
          translateView(context, model.tableTranslate),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppIconButton(
                onPressed: () {},
                icon: Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
              ),
              AppIconButton(
                onPressed: () {},
                icon: Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
              )
            ],
          ),
          Row(
            children: [
              AppIconButton(
                onPressed: () {},
                icon: Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: AppTextField(
                  controller: controller,
                  focusNode: focusNode,
                  hint: "",
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppInkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
              ),
              AppInkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
              )
            ],
          )
        ],
      );
    });
  }

  Widget translateView(BuildContext context, TabTranslateState tab) {
    switch (tab) {
      case TabTranslateState.doubleTranslate:
        return translateDoubleWidget(context);
      case TabTranslateState.singleTranslate:
        return translateSingleWidget(context);
      case TabTranslateState.listTranslate:
        return translateListWidget(context);
    }
  }

  Widget translateDoubleWidget(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          Expanded(child: Text("Duoc Dichj")),
          Expanded(child: Text("Dich")),
        ],
      ),
    );
  }

  Widget translateSingleWidget(BuildContext context) {
    return Expanded(child: Text("Duoc Dichj"));
  }

  Widget translateListWidget(BuildContext context) {
    var list = [1, 2, 3, 4, 5];
    return Expanded(
      child: ListView.builder(
          itemCount: list.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Text(list[index].toString()),
            );
          }),
    );
  }
}
