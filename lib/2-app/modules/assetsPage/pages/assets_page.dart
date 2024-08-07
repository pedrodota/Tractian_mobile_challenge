import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_challenge/2-app/modules/assetsPage/widgets/custom_search_field.dart';
import 'package:tractian_challenge/2-app/modules/assetsPage/widgets/expansible_list_tile.dart';
import 'package:tractian_challenge/2-app/modules/assetsPage/controllers/assets_page_controller.dart';
import 'package:tractian_challenge/2-app/modules/shared/backgrounds/default_background.dart';
import 'package:tractian_challenge/2-app/modules/shared/widgets/text_widget.dart';
import 'package:tractian_challenge/2-app/utils/app_measurements.dart';
import 'package:tractian_challenge/2-app/utils/colors.dart';

class AssetsPage extends StatefulWidget {
  final String companyId;

  const AssetsPage({Key? key, required this.companyId}) : super(key: key);

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  late final AssetsPageController controller;

  @override
  void initState() {
    controller = Get.put(AssetsPageController(widget.companyId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBackground(
      title: "Assets",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 2.h),
          TextFieldWidget(hintText: 'Buscar Ativo ou Local',  controller: controller.searchText),
          SizedBox(height: 1.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Obx(
              () => Row(
                children: [
                  GestureDetector(
                    onTap: controller.filterListFromEnergySensors,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                      decoration: BoxDecoration(
                        color: controller.isEnergyFilterActive.value ? primaryBlue : white,
                        border: Border.all(color: controller.isEnergyFilterActive.value ? primaryBlue : containerBorderColor),
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.bolt,
                            color: controller.isEnergyFilterActive.value ? white : containerTextColor,
                          ),
                          SizedBox(width: 2.w),
                          TextWidget(
                            'Sensor de Energia',
                            textColor: controller.isEnergyFilterActive.value ? white : containerTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  GestureDetector(
                    onTap: controller.filterListFromCriticalAlert,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                      decoration: BoxDecoration(
                        color: controller.isCriticalAlertFilterActive.value ? primaryBlue : white,
                        border: Border.all(color: controller.isCriticalAlertFilterActive.value ? primaryBlue : containerBorderColor),
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: controller.isCriticalAlertFilterActive.value ? white : containerTextColor,
                          ),
                          SizedBox(width: 2.w),
                          TextWidget(
                            'Crítico',
                            textColor: controller.isCriticalAlertFilterActive.value ? white : containerTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Container(height: 1, color: containerBorderColor),
          SizedBox(height: 2.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Obx(() {
                if (controller.isLoading ) {
                  return const Center(child: CircularProgressIndicator.adaptive());
                  // return ListView.separated(
                  //   shrinkWrap: true,
                  //   itemCount: 8,
                  //   separatorBuilder: (context, index) => const SizedBox(
                  //     height: 8,
                  //   ),
                  //   itemBuilder: (context, index) {
                  //     return Container(height: 5.h, color: textFieldBackgroundColor, width: 60.w,);
                  //   },
                  // );
                } else if (controller.nodesFilteredList.isEmpty) {
                  return const Center(
                    child: Text('Assets not found'),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.nodesNoParentsList.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemBuilder: (context, index) {
                    final item = controller.nodesNoParentsList[index];
                    return ExpansibleListTile(
                      item: item,
                      listNodes: controller.nodesFilteredList,
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
