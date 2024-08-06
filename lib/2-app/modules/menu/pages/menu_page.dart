import 'package:flutter/material.dart';
import 'package:tractian_challenge/2-app/modules/assetsPage/pages/assets_page.dart';
import 'package:tractian_challenge/2-app/modules/menu/controllers/menu_page_controller.dart';
import 'package:tractian_challenge/2-app/modules/menu/widgets/unit_container.dart';
import 'package:tractian_challenge/2-app/modules/shared/backgrounds/default_background.dart';
import 'package:get/get.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late final MenuPageController _controller;

  @override
  void initState() {
    _controller = Get.put(MenuPageController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBackground(
      child: Obx(() {
        if (_controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (_controller.companies.isEmpty) {
          return const Center(child: Text("No Companies Found"));
        }
        return ListView.builder(
          itemCount: _controller.companies.length,
          itemBuilder: (context, index) {
            return UnitContainer(
              name: _controller.companies[index].name,
              onTap: () => Get.to(() => AssetsPage(
                    companyId: _controller.companies[index].id,
                  )),
            );
          },
        );
      }),
    );
  }
}
