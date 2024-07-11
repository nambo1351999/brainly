import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../components/app_ink_well.dart';

class ItemSettings extends StatelessWidget {
  final Function onTap;
  final String title;
  final String icon;

  const ItemSettings(
      {super.key,
      required this.onTap,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
        onTap: () {
          onTap.call();
          Navigator.pop(context);
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Image.asset(icon, width: 24, height: 24,),
              const Gap(16),
              Text(title),
            ],
          ),
        ));
  }
}
