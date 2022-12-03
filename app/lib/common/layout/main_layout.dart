import 'package:app/common/themes/theme_notifier.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget body;
  final String? title;
  final Widget? bottomNavBar;
  final Widget? fab;
  const MainLayout({
    this.backgroundColor,
    required this.body,
    this.title,
    this.bottomNavBar,
    this.fab,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: body,
      bottomNavigationBar: bottomNavBar,
      floatingActionButton: fab,
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    }

    return AppBar(
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () {
            print(ThemeNotifier().isDark);

            ThemeNotifier().isDark ? ThemeMode.light : ThemeMode.dark;
          },
          icon: Icon(
            ThemeNotifier().isDark ? Icons.nightlight_round : Icons.wb_sunny,
          ),
        ),
      ],
      elevation: 0,
      title: Text(
        title!,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
