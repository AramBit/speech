import 'package:flutter/material.dart';

import '../../presentation/ui/battle_page.dart';
import '../../presentation/ui/login_page.dart';
import '../../presentation/ui/massage_page.dart';
import '../../presentation/ui/speech_page.dart';

class HomeState {
  static List<Widget> pages = [
    const SpeechPage(),
    const BattlePage(),
    const MassagePage(),
    const LoginPage(),
  ];
  int sellectIndexBottomBar;

  HomeState({
    this.sellectIndexBottomBar = 0,
  });

  HomeState copyWith({
    int? getSellectIndexBottomBar,
  }) {
    return HomeState(
      sellectIndexBottomBar: getSellectIndexBottomBar ?? sellectIndexBottomBar,
    );
  }
}
