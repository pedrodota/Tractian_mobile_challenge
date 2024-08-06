import 'package:flutter/foundation.dart';
import 'package:tractian_challenge/1-base/models/company.dart';
import 'package:tractian_challenge/1-base/services/interfaces/icompany_service.dart';
import 'package:tractian_challenge/2-app/modules/assetsPage/widgets/assets_model.dart';
import 'package:tractian_challenge/2-app/modules/assetsPage/widgets/location_model.dart';
import 'package:get/get.dart';

class CompanyService extends GetConnect implements ICompanyService {

  final _serviceUrl = 'https://fake-api.tractian.com/companies';

  @override
  Future<List<Company>> getCompanies() async {
    final response = await get(_serviceUrl);
    if (response.statusCode == 200) {
      final result = response.body as List;
      return result.map((company) => Company.fromJson(company)).toList();
    } else {
      throw Exception('Failed to load companies');
    }
  }

  @override
  Future<List<AssetsModel>> getAssetsList(String companyId) async {
    final response = await get('$_serviceUrl/$companyId/assets');
    if (response.statusCode == 200) {
      final jsonResponse = await compute(AssetsModel.fromJsonList, response.body as List);
      return jsonResponse;
    } else {
      throw Exception('Failed to load companies');
    }
  }

  @override
  Future<List<LocationModel>> getLocationsList(String companyId) async {
    final response = await get('$_serviceUrl/$companyId/locations');
    if (response.statusCode == 200) {
      final jsonResponse = await compute(LocationModel.fromJsonList, response.body as List);
      return jsonResponse;
    } else {
      throw Exception('Failed to load companies');
    }
  }
}
