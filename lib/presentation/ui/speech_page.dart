import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/streamCubit/stream_cubit.dart';
import '../../domain/streamCubit/stream_state.dart';
import '../uiComponents/camera_box.dart';
import '../uiComponents/comments_box.dart';
import '../uiComponents/microphone_voice_box.dart';
import '../uiComponents/pattern_text_widget.dart';
import '../uiComponents/speech_text_field.dart';
import '../uiConstants/ui_colors.dart';

class SpeechPage extends StatelessWidget {
  const SpeechPage({super.key});

  @override
  Widget build(BuildContext context) {
    StreamCubit streamCubit = context.watch<StreamCubit>();
    return SafeArea(
      child: Column(
        children: [
          // stream
          Expanded(
            flex: 3,
            child: BlocBuilder<StreamCubit, StreamState>(
              bloc: streamCubit,
              builder: (context, state) {
                return Container(
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: state.streamCreateController != null
                                ? CameraBox(
                                    percentText: '50%',
                                    state: state,
                                    streamCameraOrPlayer: true,
                                    winnerText: '5 Win',
                                    percentBackColor:
                                        UiColors.streamPercentBackColor,
                                  )
                                : Center(
                                    child: CircularProgressIndicator(
                                      color: UiColors.streamPercentBackColor,
                                      strokeWidth: 1,
                                    ),
                                  ),
                          ),
                          Expanded(
                            child: state.streamPlayer != null
                                ? CameraBox(
                                    percentText: '50%',
                                    state: state,
                                    streamCameraOrPlayer: false,
                                    winnerText: '3 Win',
                                    percentBackColor:
                                        UiColors.streamPlayerPercentBackColor,
                                  )
                                : Center(
                                    child: CircularProgressIndicator(
                                      color:
                                          UiColors.streamPlayerPercentBackColor,
                                      strokeWidth: 1,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: MicrophoneVoiceBox(
                          onTapMicrophone: () {},
                          onTapVoice: () {},
                        ),
                      ),
                      Positioned(
                        left: (MediaQuery.of(context).size.width / 2) / 2 - 33,
                        top: 320,
                        child: GestureDetector(
                          onTap: () {
                            streamCubit.startStreaming();
                          },
                          child: Image.asset(
                            'assets/icons/btn.png',
                            width: 55,
                          ),
                        ),
                      ),
                      Positioned(
                        right: (MediaQuery.of(context).size.width / 2) / 2 - 33,
                        top: 320,
                        child: GestureDetector(
                          onTap: () {
                            streamCubit.stopStreaming();
                          },
                          child: Image.asset(
                            'assets/icons/btn2.png',
                            width: 55,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // comments
          Expanded(
            flex: 2,
            child: Container(
              child: Stack(
                children: [
                  ListView.builder(
                    reverse: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 7,
                        ),
                        child: CommentBox(),
                      );
                    },
                  ),
                  // views count
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: UiColors.uiBlack.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 8),
                          ),
                          BoxShadow(
                            color: UiColors.uiBlack.withOpacity(0.6),
                            spreadRadius: 30,
                            blurRadius: 30,
                            offset: const Offset(0, 45),
                          ),
                        ],
                        color: UiColors.uiBlack,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 5,
                            ),
                            child: Image.asset(
                              'assets/icons/users.png',
                              width: 16,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              right: 5,
                            ),
                            child: PatternTextWidget(
                              text: '122',
                              fontSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 5,
                            ),
                            child: Image.asset(
                              'assets/icons/•.png',
                              width: 5,
                            ),
                          ),
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 8,
                              ),
                              child: PatternTextWidget(
                                text:
                                    'Ем кошачий корм и смотрю на реакцию своего котаааааааа',
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/icons/DownArrow.png',
                            width: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // speech field
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              bottom: 8,
            ),
            child: Row(
              children: [
                const Expanded(child: SpeechTextField()),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Image.asset(
                      'assets/icons/share-ios.png',
                      width: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
