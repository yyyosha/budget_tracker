import 'package:budget_tracker/app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar({
    required this.body,
    required this.currentIndex,
    this.floatingActionButton,
    this.appBar,
    super.key,
  });

  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget body;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: body,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: "Transactions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_rounded),
            label: "Add new",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: "Statistics",
          ),
        ],
        currentIndex: currentIndex,
        onTap: _onSelectScreen,
      ),
    );
  }

  _onSelectScreen(int index) {
    return switch (index) {
      0 => Get.toNamed(Routes.transactionList),
      1 => Get.toNamed(Routes.transactionCreateUpdate),
      2 => Get.toNamed(Routes.statistics),
      _ => null,
    };
  }
}
