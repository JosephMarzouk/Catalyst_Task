import 'package:bloc/bloc.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Data/models/properties_model/properties_model.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Data/repos/AllPropertiesRepo.dart';
import 'package:equatable/equatable.dart';

part 'properties_state.dart';

class PropertiesCubit extends Cubit<PropertiesState> {
  PropertiesCubit(this.allPropertiesRepo) : super(PropertiesInitial());

  final AllPropertiesRepo allPropertiesRepo ;

  Future<void> getProperties() async {
    try {
      emit(GetAllPropertiesLoading());
      final properties = await allPropertiesRepo.getAllProperties();
      print(properties);
      emit(GeatAllPropertiesSuccess(properties: properties));
    } catch (e) {
      emit(GetAllPropertiesFailuer(error: e.toString()));
    }
  }

  Future<void> createProperty({required Map<String, dynamic> body}) async {
    try {
      emit(CreatePropertiesLoading());
      final Properties = await allPropertiesRepo.createProperty(body: body);
      print(Properties);
      emit(CreatePropertiesSuccess());
    } catch (e) {
      emit(CreatePropertiesFailuer(error: e.toString()));
    }
  }

  Future<void> deleteProperty({required String id}) async {
    try {
      emit(DeletePropertiesLoading());
      final Properties = await allPropertiesRepo.deleteProperty(id: id);
      print(Properties);
      emit(DeletePropertiesSuccess());
    } catch (e) {
      emit(DeletePropertiesFailuer(error: e.toString()));
    }
  }

   Future<void> editProperty({required Map<String, dynamic> body,required String id}) async {
     try {
      emit(UpdatePropertiesLoading());
      final Properties = await allPropertiesRepo.updateProperty(body: body,id: id);
      print(Properties);
      emit(UpdatePropertiesSuccess());
    } catch (e) {
      emit(UpdatePropertiesFailuer(error: e.toString()));
    }
  }
}
