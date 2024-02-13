import 'package:budget_tracker/app/router/app_router.dart';
import 'package:budget_tracker/app/theme/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar({
    required this.body,
    required this.currentIndex,
    this.floatingActionButton,
    this.noData = false,
    this.appBar,
    this.needRefresh = true,
    this.noDataDescription = "There are is not transactions",
    super.key,
  });

  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget body;
  final int currentIndex;
  final bool needRefresh;
  final bool noData;
  final String noDataDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSizes.paddingMedium,
              horizontal: AppSizes.paddingMedium,
            ),
            child: noData
                ? Center(
                    child: Text(
                      noDataDescription,
                      style: const TextStyle(
                        fontSize: AppSizes.fontSizeLarge,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                : body,
          ),
        ),
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
      2 => Get.toNamed(
          Routes.statistics,
          parameters: needRefresh ? {"id": "refreshId"} : {},
        ),
      _ => null,
    };
  }
}
