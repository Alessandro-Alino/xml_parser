import 'package:flutter/material.dart';
import 'package:xml_parser/feature/api/screen/api_page.dart';
import 'package:xml_parser/feature/xml/screen/xml_page.dart';
import 'package:xml_parser/widget/app_nav_bar.dart';

import 'feature/upload/screen/upload_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  final double maxWidth = 750.0;

  @override
  void dispose() {
    _pageController.dispose();
    _currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: PageView(
            onPageChanged: (e) {
              _currentIndex.value = e;
            },
            controller: _pageController,
            children: [
              XmlPage(),
              ApiPage(),
              UploadPage(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Spacer(),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width < maxWidth
                  ? MediaQuery.sizeOf(context).width
                  : maxWidth,
            ),
            child: AppNavBar(
              currentIndex: _currentIndex,
              pageController: _pageController,
            ),
          ),
          Spacer(),
        ],
      ),
      //AppBottomNavBar(pageController: _pageController),
    );
  }
}
