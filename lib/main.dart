import 'package:budget_tracker/app/di/di.dart';
import 'package:budget_tracker/app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  injectDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await _initDatabase();

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

Future<void> _initDatabase() async {
  await Hive.initFlutter('hive');

  // load version
  Box box = await Hive.openBox('version');
  const String version = '1.1';
  final String? stored = box.get(0);

  // clean cache if mismatched
  if (stored != version) {
    await Hive.close();
    await Hive.deleteBoxFromDisk('hive');
    await Hive.initFlutter('hive');
    Hive.openBox('version').then((box) async {
      await box.put(0, version);
      await box.close();
    });
  }
}
