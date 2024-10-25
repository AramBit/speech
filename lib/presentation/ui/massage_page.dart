import 'package:flutter/material.dart';
import 'package:video_live_project/presentation/uiConstants/ui_colors.dart';

class MassagePage extends StatelessWidget {
  const MassagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.uiWhite,
      body: const Center(
        child: Text('Massage page'),
      ),
    );
  }
}
