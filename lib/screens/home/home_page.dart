import 'package:brainly/components/app_ink_well.dart';
import 'package:brainly/screens/translate/model/translate_model.dart';
import 'package:brainly/screens/translate/presentation/translate_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTranslate(context),
      body: const TranslatePage(),
      drawer: const Drawer(),
    );
  }

  AppBar appBarTranslate(BuildContext context) {
    return AppBar(
      title: const Text("app_name").tr(),
      centerTitle: false,
      actions: [
        AppInkWell(
          onTap: () {
            context
                .read<TranslateModel>()
                .updateStateTabTranslate(TabTranslateState.doubleTranslate);
          },
          child: Container(
            height: 24,
            width: 24,
            color: Colors.red,
          ),
        ),
        const Gap(8),
        AppInkWell(
          onTap: () {
            context
                .read<TranslateModel>()
                .updateStateTabTranslate(TabTranslateState.singleTranslate);
          },
          child: Container(
            height: 24,
            width: 24,
            color: Colors.yellow,
          ),
        ),
        const Gap(8),
        AppInkWell(
          onTap: () {
            context
                .read<TranslateModel>()
                .updateStateTabTranslate(TabTranslateState.listTranslate);
          },
          child: Container(
            height: 24,
            width: 24,
            color: Colors.black,
          ),
        ),
        const Gap(8),
        AppInkWell(
          onTap: () {
            context
                .read<TranslateModel>()
                .updateStateTabTranslate(TabTranslateState.listTranslate);
          },
          child: Container(
            height: 24,
            width: 24,
            color: Colors.blue,
          ),
        ),
        const Gap(8),
      ],
    );
  }
}
