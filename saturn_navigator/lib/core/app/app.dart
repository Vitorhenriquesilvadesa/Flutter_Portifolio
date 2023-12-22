import 'package:flutter/material.dart';
import 'package:saturn_navigator/pages/home_page/home_page.dart';

class SaturnApp extends StatefulWidget {
  const SaturnApp({super.key});

  @override
  State<SaturnApp> createState() => _SaturnAppState();
}

class _SaturnAppState extends State<SaturnApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
