part of 'properties_cubit.dart';

sealed class PropertiesState extends Equatable {
  const PropertiesState();

  @override
  List<Object> get props => [];
}

final class PropertiesInitial extends PropertiesState {}

final class GetAllPropertiesLoading extends PropertiesState {}
final class GeatAllPropertiesSuccess extends PropertiesState {
  final List<PropertiesModel> properties;

  const GeatAllPropertiesSuccess({required this.properties});
}
final class GetAllPropertiesFailuer extends PropertiesState {
  final String error;

  const GetAllPropertiesFailuer({required this.error});
}

final class CreatePropertiesLoading extends PropertiesState {}
final class CreatePropertiesSuccess extends PropertiesState {
  
}
final class CreatePropertiesFailuer extends PropertiesState {
  final String error;

  const CreatePropertiesFailuer({required this.error});
}



final class DeletePropertiesLoading extends PropertiesState {}
final class DeletePropertiesSuccess extends PropertiesState {
  
}
final class DeletePropertiesFailuer extends PropertiesState {
  final String error;

  const DeletePropertiesFailuer({required this.error});
}



final class UpdatePropertiesLoading extends PropertiesState {}
final class UpdatePropertiesSuccess extends PropertiesState {
  
}
final class UpdatePropertiesFailuer extends PropertiesState {
  final String error;

  const UpdatePropertiesFailuer({required this.error});
}