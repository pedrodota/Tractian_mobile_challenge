import 'package:get/state_manager.dart';

abstract class BaseController extends GetxController {
  late RxBool _isLoading;
  BaseController() {
    _isLoading = false.obs;
    start();
  }
  void start();
  bool get isLoading => _isLoading.value;
  RxBool get isLoadingRx => _isLoading;
  set isLoading(bool value) => _isLoading.value = value;
}
