import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:tractian_challenge/2-app/modules/menu/pages/menu_page.dart';
import 'package:tractian_challenge/2-app/utils/app_measurements.dart';
import 'package:tractian_challenge/2-app/utils/colors.dart';
import 'package:get/get.dart';
import 'package:tractian_challenge/2-app/utils/instances.dart';

void main() {
  initInstances();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(
        builder: (context, orientation) {
          if (MediaQuery.of(context).size == Size.zero) return const SizedBox();
          
          AppMeasurements.setAppMeasurements(context);
          if (constraints.maxWidth == 0 || constraints.maxHeight == 0) {
            return const SizedBox();
          }
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          return GetMaterialApp(
            title: 'TractianChallenge',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: darkBlue),
              useMaterial3: true,
            ),
            builder: (context, child) {
              return ScrollConfiguration(
                behavior: MyBehavior(),
                child: child ?? const SizedBox(),
              );
            },
            home: const MenuPage(),
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
          );
        },
      );
    });
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
