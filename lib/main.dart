import 'package:budget_tracker/app/di/di.dart';
import 'package:budget_tracker/app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  injectDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter('hive');

  runApp(
    GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        title: "Budget Tracker",
        initialRoute: Routes.transactionList,
        getPages: AppRouter.routes,
        defaultTransition: Transition.fadeIn,
      ),
    ),
  );
}
