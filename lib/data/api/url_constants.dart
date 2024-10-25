import 'package:apivideo_live_stream/apivideo_live_stream.dart';

class UrlParameters {
  static VideoConfig video =
      VideoConfig.withDefaultBitrate(resolution: Resolution.RESOLUTION_360);
  static AudioConfig audio = AudioConfig();
  static const String rtmpUrl = "rtmp://157.245.65.56/live";
  static const String streamKey = "123450";
  static const String registrationUrl =
      'http://157.245.65.56:8066/api/v1/users/signup';
  static const String registrationConfirm =
      'http://157.245.65.56:8066/api/v1/users/email/confirm';

  static const String signInUrl = 'http://157.245.65.56:8066/api/v1/login';
  static const String recoverPsswordUrl =
      'http://157.245.65.56:8066/api/v1/recover-password';
  static const String retryCodeUrl =
      'http://157.245.65.56:8066/api/v1/retry_send_code';
}
