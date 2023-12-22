import 'package:flutter/material.dart';
import 'package:saturn_navigator/pages/app_themes.dart';
import 'package:saturn_navigator/pages/home_page/widgets/home_header.dart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getColor(Palette.backgroundColor),
      body: const Column(
        children: [
          HomeHeader(),
        ],
      ),
    );
  }
}
