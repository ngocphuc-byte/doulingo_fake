import 'package:bloc/bloc.dart';
import 'package:doulingo_fake/data/repository/package_repo.dart';
import 'package:doulingo_fake/models/package_model.dart';
import 'package:equatable/equatable.dart';

part 'package_event.dart';
part 'package_state.dart';

class PackageBloc extends Bloc<PackageEvent, PackageState> {
  PackageRepo packageRepo = PackageRepo();
  late List<PackageModel> packageList;
  PackageBloc() : super(PackageInitial()) {
    on<GetPackage>(_onGetAllPackage);
  }

  Future _onGetAllPackage(GetPackage event, Emitter<PackageState> emit) async {
    emit(PackageLoading());
    packageList = await packageRepo.getPackageList();
    emit(PackageLoaded(packageList: packageList));
  }
}
