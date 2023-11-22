import 'package:flutter/foundation.dart';

class Utils {
  static log(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
