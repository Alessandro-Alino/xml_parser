import 'dart:ui';
import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar(
      {super.key, required this.currentIndex, required this.pageController});

  final ValueNotifier<int> currentIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentIndex,
      builder: (context, value, child) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.0),
            border: Border.all(
                width: 2.0, color: Colors.cyan.shade900.withValues(alpha: 0.2)),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.blueGrey.shade100.withValues(alpha: 0.3),
            ),
            height: 70.0,
            clipBehavior: Clip.hardEdge,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  currentIndex: value,
                  onTap: (index) {
                    currentIndex.value = index;
                    pageController.animateToPage(
                      index,
                      duration: Durations.long1,
                      curve: Curves.easeInOut,
                    );
                  },
                  selectedItemColor: Colors.blueGrey.shade800,
                  selectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  items: [
                    BottomNavigationBarItem(
                      label: 'XML Parser',
                      icon: Icon(Icons.account_tree_rounded),
                    ),
                    BottomNavigationBarItem(
                      label: 'Generate API',
                      icon: Icon(Icons.api),
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
