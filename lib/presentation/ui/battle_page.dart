import 'package:flutter/material.dart';

import '../uiConstants/ui_colors.dart';

class BattlePage extends StatelessWidget {
  const BattlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.uiWhite,
      body: const Center(
        child: Text('Battle page'),
      ),
    );
  }
}
