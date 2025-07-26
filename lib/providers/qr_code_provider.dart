import 'package:flutter_riverpod/flutter_riverpod.dart';

class QRCodeNotifier extends StateNotifier<String> {
  QRCodeNotifier() : super(_generateInitialQRData());

  static const String _baseUserId = "user-id-12345-abcde";

  static String _generateInitialQRData() {
    return _baseUserId;
  }

  void refreshQRCode() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    state = "$_baseUserId-$timestamp";
  }

  String get currentQRData => state;
}

final qrCodeProvider = StateNotifierProvider<QRCodeNotifier, String>((ref) {
  return QRCodeNotifier();
});
