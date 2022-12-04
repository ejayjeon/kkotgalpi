import 'package:app/common/layout/main_layout.dart';
import 'package:app/common/themes/custom_theme.dart';
import 'package:app/user/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  static String get routeName => 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int idx = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
    _controller.addListener(tabListenr);
  }

  @override
  void dispose() {
    _controller.removeListener(tabListenr);
    super.dispose();
  }

  void tabListenr() {
    setState(() {
      idx = _controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: '꽃갈피',
      body: TabBarView(
        controller: _controller,
        children: [
          // Container(
          //   child: Center(
          //     child: Text(
          //       '홈',
          //       style: lightTextStyle,
          //     ),
          //   ),
          // ),
          LoginScreen(),
          Container(
            child: Center(
              child: Text(
                '글쓰기',
                style: lightTextStyle,
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                '나의 책',
                style: lightTextStyle,
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                '북마크',
                style: lightTextStyle,
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                '프로필',
                style: lightTextStyle,
              ),
            ),
          ),
        ],
      ),
      bottomNavBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int idx) {
          _controller.animateTo(idx);
        },
        currentIndex: idx,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: '글쓰기',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode_outlined),
            label: '나의 책',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: '북마크',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '프로필',
          ),
        ],
      ),
    );
  }
}
