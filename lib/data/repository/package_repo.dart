import 'package:doulingo_fake/data/provider/package_provider.dart';
import 'package:doulingo_fake/models/package_model.dart';
import 'package:flutter/cupertino.dart';

class PackageRepo {
  PackageProvider packageProvider = PackageProvider();
  Future<List<PackageModel>> getPackageList() async {
    return packageProvider.getAllPackage();
  }

  Future updatePackage(
      {required String id_Level, required String id_USer}) async {
    return packageProvider.updatePackage(id_Level, id_USer);
  }
}
