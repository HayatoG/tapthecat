import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6586513791677324/2062207584';
    } else if (Platform.isIOS) {
      return 'NOTHING';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}
