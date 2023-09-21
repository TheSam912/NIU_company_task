import 'dart:io';

String check() {
  if (Platform.isAndroid) {
    return "Android";
  } else if (Platform.isIOS) {
    return "IOS";
  }
  return "Undefine";
}
