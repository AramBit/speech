import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../data/api/url_constants.dart';

class CreatingStreamService {
  static ApiVideoLiveStreamController createLiveStreamController() {
    return ApiVideoLiveStreamController(
        initialAudioConfig: UrlParameters.audio,
        initialVideoConfig: UrlParameters.video,
        onConnectionSuccess: () {
          print('Connection succeeded');
        },
        onConnectionFailed: (error) {
          print('Connection failed: $error');
        },
        onDisconnection: () {},
        onError: (error) {
          print('disconnect');
        });
  }

  static Future<void> startStreaming(
      ApiVideoLiveStreamController? streamController,
      FijkPlayer? streamPlayerController) async {
    if (streamController == null) return;
    return await streamController
        .startStreaming(streamKey: UrlParameters.streamKey, url: UrlParameters.rtmpUrl)
        .then((value) async {
      // phoneAwake(true);
    });
  }

  static Future<void> toggleMicrophone(
      ApiVideoLiveStreamController? streamController) async {
    if (streamController == null) return;

    return await streamController.toggleMute();
  }

  static void phoneAwake(bool isStreaming) {
    if (isStreaming) {
      WakelockPlus.enable();
    } else {
      WakelockPlus.disable();
    }
  }

  static Future<void> stopStreaming(
      ApiVideoLiveStreamController? streamController) async {
    if (streamController == null) return;

    return await streamController.stopStreaming();
  }
}
