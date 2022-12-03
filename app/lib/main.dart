import 'package:app/common/themes/custom_theme.dart';
import 'package:app/common/themes/theme_notifier.dart';
import 'package:app/common/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const _App());
}

class _App extends ConsumerStatefulWidget {
  const _App({super.key});

  @override
  ConsumerState<_App> createState() => _AppState();
}

class _AppState extends ConsumerState<_App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      // theme: lightThemeData,
      // darkTheme: darkThemeData,
      theme: ThemeNotifier().isDark ? darkThemeData : lightThemeData,
      // themeMode: customThemeMode,
    );
  }
}
