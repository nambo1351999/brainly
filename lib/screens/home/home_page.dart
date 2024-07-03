import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("app_name").tr(),
      ),
      body: Container(
        child: InkWell(
          onTap: () {
            context.go('/settings');
          },
          child: Text("NAMMMMMMM"),
        ),
      ),
      drawer: Drawer(

      ),
    );
  }
}
