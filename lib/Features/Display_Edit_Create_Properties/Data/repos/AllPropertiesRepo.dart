
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Data/models/properties_model/properties_model.dart';

abstract class AllPropertiesRepo {
  Future<List<PropertiesModel>> getAllProperties();
  Future<List<PropertiesModel>> createProperty(
      {required Map<String, dynamic> body});
  Future<List<PropertiesModel>> updateProperty(
      {required Map<String, dynamic> body});
  Future<List<PropertiesModel>> deleteProperty();
}
