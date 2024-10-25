import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:fijkplayer/fijkplayer.dart';

class StreamState {
  ApiVideoLiveStreamController? streamCreateController;
  FijkPlayer? streamPlayer;
  StreamState({
    this.streamCreateController,
    this.streamPlayer,
  });

  StreamState coppyWidth({
    ApiVideoLiveStreamController? getStreamCreateController,
    FijkPlayer? getStreamPlayer,
  }) {
    return StreamState(
      streamCreateController:
          getStreamCreateController ?? streamCreateController,
      streamPlayer: getStreamPlayer ?? streamPlayer,
    );
  }
}
