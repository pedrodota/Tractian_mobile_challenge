import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tractian_challenge/1-base/services/interfaces/icompany_service.dart';
import 'package:tractian_challenge/2-app/modules/assetsPage/widgets/assets_model.dart';
import 'package:tractian_challenge/2-app/modules/assetsPage/widgets/location_model.dart';
import 'package:tractian_challenge/2-app/modules/assetsPage/widgets/node_entity.dart';
import 'package:tractian_challenge/2-app/modules/shared/controllers/base_controller.dart';
import 'package:tractian_challenge/2-app/utils/instances.dart';

class AssetsPageController extends BaseController {
  final String companyId;
  AssetsPageController(this.companyId);

  late final TextEditingController searchText;
  late final RxList<AssetsModel> _assetsList;
  late final RxList<LocationModel> _locationsList;
  late final RxList<NodeEntity> _nodesList;
  late final RxList<NodeEntity> nodesFilteredList;
  late final RxList<NodeEntity> nodesNoParentsList;
  late final RxBool isEnergyFilterActive;
  late final RxBool isCriticalAlertFilterActive;

  @override
  void start() {
    searchText = TextEditingController();
    _assetsList = RxList<AssetsModel>([]);
    _locationsList = RxList<LocationModel>([]);
    _nodesList = RxList<NodeEntity>([]);
    nodesFilteredList = RxList<NodeEntity>([]);
    nodesNoParentsList = RxList<NodeEntity>([]);
    isEnergyFilterActive = false.obs;
    isCriticalAlertFilterActive = false.obs;
    super.onInit();
    fetchAssetsAndLocations();
  }

  Future<void> fetchAssetsAndLocations() async {
    isLoading = true;
    final companyService = instanceManager.get<ICompanyService>();
    try {
      _assetsList.assignAll(await companyService.getAssetsList(companyId));
      _locationsList.assignAll(await companyService.getLocationsList(companyId));
      computeListAction();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
    }
  }

  void computeListAction() {
    _nodesList.value = [
      ..._assetsList,
      ..._locationsList,
    ];
    isEnergyFilterActive.value = false;
    isCriticalAlertFilterActive.value = false;
    filterList();
  }

  void filterListFromEnergySensors() {
    isEnergyFilterActive.value = !isEnergyFilterActive.value;
    isCriticalAlertFilterActive.value = false;
    filterList();
  }

  void filterListFromCriticalAlert() {
    isEnergyFilterActive.value = false;
    isCriticalAlertFilterActive.value = !isCriticalAlertFilterActive.value;
    filterList();
  }

  void filterList() {
    final List<NodeEntity> temporaryList = _nodesList.where((e) {
      bool matchesEnergyFilter = !isEnergyFilterActive.value || (e is AssetsModel && e.sensorType.toLowerCase().contains("energy"));
      bool matchesCriticalAlertFilter = !isCriticalAlertFilterActive.value || (e is AssetsModel && e.status.toLowerCase().contains("alert"));
      bool matchesSearchText = searchText.text.isEmpty || e.name.toLowerCase().contains(searchText.text.toLowerCase());

      return matchesEnergyFilter && matchesCriticalAlertFilter && matchesSearchText;
    }).toList();

    nodesFilteredList.value = temporaryList;
    nodesNoParentsList.value = nodesFilteredList
        .where(
          (value) => value.parentId == null || !nodesFilteredList.any((element) => value.parentId == element.id || value.locationId == element.id),
        )
        .toList();
  }
}
