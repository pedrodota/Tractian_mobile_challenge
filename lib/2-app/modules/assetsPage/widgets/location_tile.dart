import 'package:flutter/material.dart';
import 'package:tractian_challenge/2-app/modules/assetsPage/widgets/location_model.dart';
import 'package:tractian_challenge/2-app/modules/shared/widgets/text_widget.dart';
import 'package:tractian_challenge/2-app/utils/colors.dart';

class LocationModelWidget extends StatelessWidget {
  final LocationModel item;
  final bool isExpanded;
  final bool hasChilds;
  final void Function()? onTap;

  const LocationModelWidget({
    super.key,
    required this.item,
    required this.isExpanded,
    required this.hasChilds,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          if (hasChilds)
            Icon(
              isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
              size: 24,
            ),
          const Icon(
            Icons.location_on_outlined,
            color: primaryBlue,
            size: 24,
          ),
          Flexible(
            child: TextWidget(
              item.name,
              textColor: black,
            ),
          ),
        ],
      ),
    );
  }
}
