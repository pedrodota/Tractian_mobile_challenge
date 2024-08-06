import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tractian_challenge/2-app/modules/assetsPage/widgets/assets_model.dart';
import 'package:tractian_challenge/2-app/modules/shared/widgets/text_widget.dart';
import 'package:tractian_challenge/2-app/utils/colors.dart';

class AssetsModelWidget extends StatelessWidget {
  final AssetsModel item;
  final bool isExpanded;
  final bool isComponent;
  final void Function()? onTap;

  const AssetsModelWidget({
    super.key,
    required this.item,
    required this.isExpanded,
    required this.isComponent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          if (!isComponent)
            Icon(
              isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
            ),
          Padding(padding: const EdgeInsets.all(2.0), child: Icon(isComponent ? CupertinoIcons.cube_box : CupertinoIcons.cube, color: primaryBlue,)),
          Flexible(
            child: TextWidget(
              item.name,
            ),
          ),
          if (item.status.contains('operating'))
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.bolt,
                color: Colors.green,
                size: 18,
              ),
            ),
          if (item.status.contains('alert'))
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.circle,
                size: 12,
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}
