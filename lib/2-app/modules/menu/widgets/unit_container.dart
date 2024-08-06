import 'package:flutter/material.dart';
import 'package:tractian_challenge/2-app/modules/shared/widgets/text_widget.dart';
import 'package:tractian_challenge/2-app/utils/app_measurements.dart';
import 'package:tractian_challenge/2-app/utils/assets.dart';
import 'package:tractian_challenge/2-app/utils/colors.dart';
import 'package:tractian_challenge/2-app/utils/fonts.dart';

class UnitContainer extends StatelessWidget {
  final String name;
  final void Function()? onTap;
  const UnitContainer({super.key, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.w)),
          color: lightBlue,
        ),
        margin: EdgeInsets.fromLTRB(5.w, 4.h, 5.w, 0),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
        child: Row(
          children: [
            Image.asset(ingotsIcon, height: 3.h),
            SizedBox(width: 5.w),
            TextWidget(
              "$name Unit",
              fontSize: fontTitle,
              textColor: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
