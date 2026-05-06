import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ThemeController manages the application's theme state and persistence.
/// 
/// This controller:
/// - Manages light/dark mode toggling
/// - Persists user preference using shared_preferences
/// - Provides accessibility-friendly colors for elderly users
/// - Works seamlessly with existing FlutterFlow theme system
class ThemeController extends ChangeNotifier {
  static const String _themePreferenceKey = 'app_theme_mode';

  bool _isDarkMode = false;
  SharedPreferences? _prefs;
  bool _isInitialized = false;

  bool get isDarkMode => _isDarkMode;
  bool get isInitialized => _isInitialized;

  /// Initialize theme controller and load saved preference
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      _prefs = await SharedPreferences.getInstance();
      _isDarkMode = _prefs?.getBool(_themePreferenceKey) ?? false;
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      debugPrint('Error initializing ThemeController: $e');
      _isInitialized = true;
    }
  }

  /// Toggle between light and dark theme
  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await _saveThemePreference();
    notifyListeners();
  }

  /// Set theme mode explicitly
  Future<void> setThemeMode(ThemeMode mode) async {
    _isDarkMode = mode == ThemeMode.dark;
    await _saveThemePreference();
    notifyListeners();
  }

  /// Save theme preference to local storage
  Future<void> _saveThemePreference() async {
    try {
      _prefs ??= await SharedPreferences.getInstance();
      await _prefs?.setBool(_themePreferenceKey, _isDarkMode);
    } catch (e) {
      debugPrint('Error saving theme preference: $e');
    }
  }

  /// Get current theme mode
  ThemeMode get currentMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  /// Get theme mode name for display
  String get themeName => _isDarkMode ? 'Dark Mode' : 'Light Mode';
}
