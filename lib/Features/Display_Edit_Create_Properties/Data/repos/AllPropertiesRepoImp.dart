import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Data/models/properties_model/properties_model.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Data/repos/AllPropertiesRepo.dart';
import 'package:catalyst_technical_task/core/APIservice.dart';

class AllPropertiesRepoImp implements AllPropertiesRepo {
final ApiService apiService;
 

  AllPropertiesRepoImp( this.apiService);

  @override
  Future<List<PropertiesModel>> createProperty({required Map<String, dynamic> body}) async{
     try {
      var data = await apiService.post(endPoint: 'properties', body: body);
      print(data);
      return (data as List).map((e) => PropertiesModel.fromJson(e)).toList();
    } catch (e) {
      print(e);

      rethrow;
    }
  }

  @override
  Future<List<PropertiesModel>> deleteProperty({required String id})async {
    try {
      var data = await apiService.delete(endPoint: 'properties', id: id);
      print(data);
      return (data as List).map((e) => PropertiesModel.fromJson(e)).toList();
    } catch (e) {
      print(e);

      rethrow;
    }
  }

  @override
  Future<List<PropertiesModel>> getAllProperties() async{
    try {
      var data = await apiService.get(endPoint: 'properties');
      List<PropertiesModel> properties = [];
      for (int i=0; i< 100; i++) {
       // print(data );
        properties.add(PropertiesModel.fromJson(data[i]));
      }
      return properties;
    } catch (e) {
      print(e);

      rethrow;
    }
  }

  @override
  Future<List<PropertiesModel>> updateProperty({required Map<String, dynamic> body, required String id}) async{
   try {
      var data = await apiService.edit(endPoint: 'properties', body: body,id: id);
      print(data);
      return (data as List).map((e) => PropertiesModel.fromJson(e)).toList();
    } catch (e) {
      print(e);

      rethrow;
    }
  }

}