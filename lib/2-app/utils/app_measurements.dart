import 'package:flutter/widgets.dart';

//Inspired on 'Sizer' package
class AppMeasurements with WidgetsBindingObserver {
  late final bool isMobile;
  late double deviceHeight;
  late double deviceWidth;
  late BuildContext context;
  static late AppMeasurements instance;
  factory AppMeasurements() => instance;
  AppMeasurements._internal();

  static void setAppMeasurements(BuildContext context) {
    instance = AppMeasurements._internal()
      ..isMobile = MediaQuery.of(context).size.width < 600
      ..deviceHeight = MediaQuery.of(context).size.height
      ..deviceWidth = MediaQuery.of(context).size.width;
  }
}

extension ExtensionMedidasAplicativo on num {
  double get w => AppMeasurements.instance.deviceWidth * (this / 100);

  double get h => AppMeasurements.instance.deviceHeight * (this / 100);

  double get sp => this * (AppMeasurements.instance.deviceWidth / 360);
}
