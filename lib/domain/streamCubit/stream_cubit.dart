import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../videoStreamService/create_stream_service.dart';
import 'stream_state.dart';

class StreamCubit extends Cubit<StreamState> {
  StreamCubit() : super(StreamState()) {
    initalizationStreamController();
  }

  void initalizationStreamController() async {
    ApiVideoLiveStreamController apiVideoLiveStreamController =
        CreatingStreamService.createLiveStreamController();
    await apiVideoLiveStreamController.initialize();

    emit(
      state.coppyWidth(
        getStreamPlayer: FijkPlayer(),
        getStreamCreateController: apiVideoLiveStreamController,
      ),
    );
  }

  void startStreaming() async {
    await CreatingStreamService.startStreaming(
        state.streamCreateController, state.streamPlayer);
    if (await state.streamCreateController?.isStreaming != null) {
      if (await state.streamCreateController!.isStreaming == true) {
        await state.streamPlayer!.setDataSource(
            'http://157.245.65.56:8088/hls/123450.m3u8',
            autoPlay: true);
      }
    }
  }

  void stopStreaming() {
    CreatingStreamService.stopStreaming(state.streamCreateController);
    emit(
      state.coppyWidth(
        getStreamPlayer: FijkPlayer(),
      ),
    );
  }

  Future<void> toggleMicrophone() async {
    CreatingStreamService.toggleMicrophone(state.streamCreateController);
  }
}
