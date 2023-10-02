import 'package:flutter/foundation.dart';

class ThemeModeProvider extends ChangeNotifier {
  bool _isLight = true;

  bool get isLight => _isLight;

  changeLightTheme() {
    _isLight = !_isLight;
    notifyListeners();
  }
}
