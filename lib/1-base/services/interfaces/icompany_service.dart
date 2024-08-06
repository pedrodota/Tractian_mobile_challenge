import 'package:tractian_challenge/1-base/models/company.dart';
import 'package:tractian_challenge/2-app/modules/assetsPage/widgets/assets_model.dart';
import 'package:tractian_challenge/2-app/modules/assetsPage/widgets/location_model.dart';

abstract class ICompanyService {
  Future<List<Company>> getCompanies();
  Future<List<AssetsModel>> getAssetsList(String companyId);
  Future<List<LocationModel>> getLocationsList(String companyId);
}
