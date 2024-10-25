import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

import '../../domain/streamCubit/stream_state.dart';
import '../uiConstants/ui_colors.dart';
import 'pattern_text_widget.dart';

class CameraBox extends StatelessWidget {
  const CameraBox({
    super.key,
    required this.state,
    required this.percentText,
    required this.winnerText,
    required this.streamCameraOrPlayer,
    required this.percentBackColor,
  });
  final StreamState state;
  final String percentText;
  final Color percentBackColor;
  final String winnerText;
  final bool streamCameraOrPlayer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              alignment:
                  streamCameraOrPlayer ? Alignment.topLeft : Alignment.topRight,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              width: double.maxFinite,
              color: percentBackColor,
              child: PatternTextWidget(
                text: percentText,
                fontSize: 12,
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(
                  12,
                ),
                bottomRight: Radius.circular(
                  12,
                ),
              ),
              child: streamCameraOrPlayer
                  ? SizedBox(
                      height: 320,
                      child: ApiVideoCameraPreview(
                        fit: BoxFit.cover,
                        controller: state.streamCreateController!,
                        child: Stack(
                          children: [
                            Container(
                              alignment: streamCameraOrPlayer
                                  ? Alignment.topLeft
                                  : Alignment.topRight,
                              margin: const EdgeInsets.only(
                                top: 15,
                                left: 15,
                              ),
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                color: UiColors.uiBlack.withOpacity(
                                  0.4,
                                ),
                                borderRadius: BorderRadius.circular(
                                  50,
                                ),
                              ),
                              child: PatternTextWidget(
                                text: winnerText,
                                fontSize: 12,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                margin: const EdgeInsets.only(
                                  bottom: 30,
                                ),
                                width: MediaQuery.of(context).size.width / 2.3,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: UiColors.uiBlack.withOpacity(
                                    0.4,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    50,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/videoAvatar.png',
                                      width: 20,
                                    ),
                                    const Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: 4,
                                        ),
                                        child: PatternTextWidget(
                                          text: 'artsolovevrukersel',
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Image.asset(
                                        'assets/icons/check.png',
                                        width: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 320,
                      child: Stack(
                        children: [
                          FijkView(
                            fit: FijkFit.cover,
                            height: 320,
                            player: state.streamPlayer!,
                            panelBuilder:
                                (player, data, context, viewSize, texturePos) {
                              return const SizedBox();
                            },
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(
                                top: 15,
                                right: 15,
                              ),
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                color: UiColors.uiBlack.withOpacity(
                                  0.4,
                                ),
                                borderRadius: BorderRadius.circular(
                                  50,
                                ),
                              ),
                              child: const PatternTextWidget(
                                text: '3 Win',
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              margin: const EdgeInsets.only(
                                bottom: 30,
                              ),
                              width: MediaQuery.of(context).size.width / 2.3,
                              height: 30,
                              decoration: BoxDecoration(
                                color: UiColors.uiBlack.withOpacity(
                                  0.4,
                                ),
                                borderRadius: BorderRadius.circular(
                                  50,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/AvatarMan.png',
                                    width: 20,
                                  ),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 4,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: PatternTextWidget(
                                          text: 'ono3242cw',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(
                                      'assets/icons/add-circled-outline.png',
                                      width: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
