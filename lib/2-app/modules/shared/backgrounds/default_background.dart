import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tractian_challenge/2-app/modules/shared/widgets/text_widget.dart';
import 'package:tractian_challenge/2-app/utils/app_measurements.dart';
import 'package:tractian_challenge/2-app/utils/assets.dart';
import 'package:tractian_challenge/2-app/utils/colors.dart';
import 'package:tractian_challenge/2-app/utils/fonts.dart';

class DefaultBackground extends StatelessWidget {
  final String? title;
  final Widget child;
  const DefaultBackground({super.key, this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: darkBlue,
                width: double.infinity,
                height: 8.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: Visibility(
                    visible: title != null,
                    replacement: Image.asset(tractianLogo, height: 5.h, width: 100.w),
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios, size: 3.h, color: Colors.white),
                          Expanded(
                            child: Center(
                              child: TextWidget(title, fontSize: fontTitle, textColor: white),
                            ),
                          ),
                          SizedBox(width: 3.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
