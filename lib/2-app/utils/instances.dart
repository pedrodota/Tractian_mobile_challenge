import 'package:get_it/get_it.dart';
import 'package:tractian_challenge/1-base/services/company/company_service.dart';
import 'package:tractian_challenge/1-base/services/interfaces/icompany_service.dart';

final instanceManager = GetIt.instance;
void initInstances() {
  instanceManager.registerLazySingleton<ICompanyService>(() => CompanyService());
}
