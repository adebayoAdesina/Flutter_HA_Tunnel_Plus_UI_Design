import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Color/colors.dart';

const _themeKey = 'theme_mode';

/// Current theme mode. MaterialApp listens to this, so changing the value
/// switches the whole app immediately.
final ValueNotifier<ThemeMode> themeModeNotifier =
    ValueNotifier<ThemeMode>(ThemeMode.light);

Future<void> loadThemeMode() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_themeKey);
    themeModeNotifier.value = ThemeMode.values.firstWhere(
      (m) => m.name == saved,
      orElse: () => ThemeMode.light,
    );
  } catch (_) {
    // Fall back to the default if storage is unavailable.
  }
}

Future<void> setThemeMode(ThemeMode mode) async {
  themeModeNotifier.value = mode;
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, mode.name);
  } catch (_) {}
}

String themeModeLabel(ThemeMode mode) {
  switch (mode) {
    case ThemeMode.light:
      return 'Light';
    case ThemeMode.dark:
      return 'Dark';
    case ThemeMode.system:
      return 'System default';
  }
}

SwitchThemeData _switchTheme() => SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.selected) ? drawerColor : null,
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.selected)
            ? drawerColor.withValues(alpha: 0.5)
            : null,
      ),
    );

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: drawerColor,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: const Color(0xFFFAFAFA),
  switchTheme: _switchTheme(),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: drawerColor,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: Colors.black,
  switchTheme: _switchTheme(),
);
