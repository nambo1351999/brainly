import 'package:brainly/components/app_text_field.dart';
import 'package:brainly/screens/translate/providers/translate_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
    return Container(
      margin: const EdgeInsets.all(16),
      child: Consumer<TranslateModel>(builder: (context, model, child) {
        return Column(
          children: [
            translateView(context, model.tableTranslate),
            Stack(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppInkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset("assets/icons/ic_microphone.png"),
                        ),
                      ),
                      const Gap(24),
                      AppInkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset("assets/icons/ic_microphone.png"),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: AppIconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/icons/ic_turn.png")),
                )
              ],
            ),
            const Gap(16),
            Row(
              children: [
                AppInkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset("assets/icons/ic_camera.png"),
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: AppTextField(
                    controller: controller,
                    focusNode: focusNode,
                    hint: "enter_text_to_translate".tr(),
                  ),
                ),
              ],
            ),
            const Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange),
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      color: Colors.grey),
                  child: const Column(
                    children: [Text("Title"), Text("Content")],
                  ),
                )),
                const Gap(8),
                Image.asset("assets/icons/ic_change.png"),
                const Gap(8),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange),
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      color: Colors.grey),
                  child: Column(
                    children: [
                      Text(
                        "Title",
                      ),
                      Text("Content")
                    ],
                  ),
                )),
              ],
            ),
            const Gap(24)
          ],
        );
      }),
    );
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
          Expanded(child: Center(child: Text("Duoc Dichj"))),
          Expanded(child: Center(child: Text("Dich"))),
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
