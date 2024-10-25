import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/homeCubit/home_cubit.dart';
import '../../domain/homeCubit/home_state.dart';
import '../uiComponents/bottom_bar_item.dart';
import '../uiComponents/pattern_text_widget.dart';
import '../uiConstants/ui_colors.dart';
import 'speech_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit.homeCubit = context.watch<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: HomeState.pages[state.sellectIndexBottomBar],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                    color: UiColors.uiBottomBarBorderTop.withOpacity(
                  0.3,
                )),
              ),
            ),
            height: 64,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BottomBarItem(
                  icon: 'assets/icons/home-simple-door.png',
                  iconColor: state.sellectIndexBottomBar == 0
                      ? UiColors.uiBottomBarItem
                      : UiColors.uiWhite,
                  text: 'Главная',
                  textColor: state.sellectIndexBottomBar == 0
                      ? UiColors.uiBottomBarItem
                      : UiColors.uiWhite,
                  onTap: () {
                    HomeCubit.homeCubit!.moveInPage(0);
                  },
                ),
                BottomBarItem(
                  icon: 'assets/icons/add-media-video.png',
                  iconColor: state.sellectIndexBottomBar == 1
                      ? UiColors.uiBottomBarItem
                      : UiColors.uiWhite,
                  text: 'Батлы',
                  textColor: state.sellectIndexBottomBar == 1
                      ? UiColors.uiBottomBarItem
                      : UiColors.uiWhite,
                  onTap: () {
                    HomeCubit.homeCubit!.moveInPage(1);
                  },
                ),
                BottomBarItem(
                  icon: 'assets/icons/chat-lines.png',
                  iconColor: state.sellectIndexBottomBar == 2
                      ? UiColors.uiBottomBarItem
                      : UiColors.uiWhite,
                  text: 'Сообщения',
                  textColor: state.sellectIndexBottomBar == 2
                      ? UiColors.uiBottomBarItem
                      : UiColors.uiWhite,
                  onTap: () {
                    HomeCubit.homeCubit!.moveInPage(2);
                  },
                ),
                BottomBarItem(
                  icon: 'assets/icons/profile-circled.png',
                  iconColor: state.sellectIndexBottomBar == 3
                      ? UiColors.uiBottomBarItem
                      : UiColors.uiWhite,
                  text: 'Профиль',
                  textColor: state.sellectIndexBottomBar == 3
                      ? UiColors.uiBottomBarItem
                      : UiColors.uiWhite,
                  onTap: () {
                    HomeCubit.homeCubit!.moveInPage(3);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
