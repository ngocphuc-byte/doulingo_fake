part of 'package_bloc.dart';

abstract class PackageState extends Equatable {
  const PackageState();
  
  @override
  List<Object> get props => [];
}

class PackageInitial extends PackageState {}

class PackageLoading extends PackageState{}

class PackageLoaded extends PackageState{
  List<PackageModel> packageList;
  PackageLoaded({required this.packageList});
}

class PackageError extends PackageState{}
