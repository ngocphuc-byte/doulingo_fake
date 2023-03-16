import 'package:doulingo_fake/data/provider/package_provider.dart';
import 'package:doulingo_fake/models/package_model.dart';

class PackageRepo {
  PackageProvider packageProvider = PackageProvider();
  Future<List<PackageModel>> getPackageList() async {
    return packageProvider.getAllPackage();
  }
}