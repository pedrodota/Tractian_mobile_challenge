import 'package:tractian_challenge/1-base/models/company.dart';
import 'package:tractian_challenge/1-base/services/interfaces/icompany_service.dart';
import 'package:tractian_challenge/2-app/modules/shared/controllers/base_controller.dart';
import 'package:get/get.dart';
import 'package:tractian_challenge/2-app/utils/instances.dart';

class MenuPageController extends BaseController {
  late final RxList<Company> companies;

  @override
  void start() {
    companies = <Company>[].obs;
    getCompanies();
  }

  Future<void> getCompanies() async {
    isLoading = true;
    companies.assignAll(await instanceManager.get<ICompanyService>().getCompanies());
    isLoading = false;
  }
}
