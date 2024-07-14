import 'package:brainly/components/app_icon_button.dart';
import 'package:brainly/components/app_ink_well.dart';
import 'package:brainly/model/user_model.dart';
import 'package:brainly/screens/math/presentation/math_page.dart';
import 'package:brainly/screens/math/providers/math_model.dart';
import 'package:brainly/screens/resize_image/resize_image_tool_page.dart';
import 'package:brainly/screens/settings/setting_page.dart';
import 'package:brainly/screens/translate/providers/translate_model.dart';
import 'package:brainly/screens/translate/presentation/translate_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'components/item_settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(builder: (context, model, child) {
      return Scaffold(
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          title: Text(appBarTitle(model.drawerStateValue)),
          centerTitle: false,
          actions: [appBarAction(model.drawerStateValue)],
        ),
        body: bodySwitchHome(model.drawerStateValue),
        drawer: Drawer(
          child: Column(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: SizedBox(
                    width: double.infinity, child: Text('Drawer Header')),
              ),
              ItemSettings(
                onTap: () {
                  context
                      .read<UserModel>()
                      .updateDrawerState(DrawerState.translates);
                },
                title: "translate".tr(),
                icon: "assets/icons/ic_translate.png",
              ),
              ItemSettings(
                onTap: () {
                  context
                      .read<UserModel>()
                      .updateDrawerState(DrawerState.maths);
                },
                title: "math".tr(),
                icon: "assets/icons/ic_maths.png",
              ),
              ItemSettings(
                onTap: () {
                  context
                      .read<UserModel>()
                      .updateDrawerState(DrawerState.resizeToolImage);
                },
                title: "resize_image".tr(),
                icon: "assets/icons/ic_resize_image.png",
              ),
              ItemSettings(
                onTap: () {
                  context
                      .read<UserModel>()
                      .updateDrawerState(DrawerState.settings);
                },
                title: "settings".tr(),
                icon: "assets/icons/ic_settings.png",
              )
            ],
          ),
        ),
      );
    });
  }

  Widget actionTranslate(BuildContext context) {
    return Row(
      children: [
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
      ],
    );
  }

  Widget appBarAction(DrawerState drawerState) {
    if (drawerState == DrawerState.translates) {
      return actionTranslate(context);
    } else if (drawerState == DrawerState.maths) {
      return actionMaths(context);
    }
    return Container();
  }

  Widget actionMaths(BuildContext context) {
    return Row(
      children: [
        AppIconButton(
            onPressed: () {
              context.read<MathModel>().updateStateTabMath(TabMathState.camera);
            },
            icon: Image.asset("assets/icons/ic_camera.png")),
        const Gap(8),
        AppIconButton(
            onPressed: () {
              context.read<MathModel>().updateStateTabMath(TabMathState.draw);
            },
            icon: Image.asset("assets/icons/ic_pencil.png")),
        const Gap(8),
        AppIconButton(
            onPressed: () {
              context
                  .read<MathModel>()
                  .updateStateTabMath(TabMathState.keyboard);
            },
            icon: Image.asset("assets/icons/ic_keyboard.png")),
        const Gap(8),
      ],
    );
  }

  String appBarTitle(DrawerState drawerState) {
    switch (drawerState) {
      case DrawerState.translates:
        return "translate".tr();
      case DrawerState.maths:
        return "math".tr();
      case DrawerState.resizeToolImage:
        return "resize_image".tr();
      case DrawerState.settings:
        return "settings".tr();
    }
  }

  Widget bodySwitchHome(DrawerState drawerState) {
    switch (drawerState) {
      case DrawerState.translates:
        return const TranslatePage();
      case DrawerState.maths:
        return const MathPage();
      case DrawerState.resizeToolImage:
        return const ResizeImageToolPage();
      case DrawerState.settings:
        return const SettingPage();
    }
  }
}
