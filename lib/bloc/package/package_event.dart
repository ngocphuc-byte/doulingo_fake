part of 'package_bloc.dart';

abstract class PackageEvent extends Equatable {
  const PackageEvent();

  @override
  List<Object> get props => [];
}


class GetPackage extends PackageEvent{
  // List<PackageModel> packageList;
  // GetPackage({required this.packageList});
}