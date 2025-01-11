import 'package:catalyst_technical_task/Features/Display_Edit_Create_Bookings/Data/repos/AllBookingRepoImp.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Data/repos/AllPropertiesRepoImp.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Users/Data/repos/AllUsersRepoImp.dart';
import 'package:catalyst_technical_task/core/APIservice.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void SetupServiceLocator() {
  getIt.registerSingleton<AllUsersRepoImp>(AllUsersRepoImp(ApiService(Dio())));
 

  getIt.registerSingleton<AllBookingRepoImp>(
      AllBookingRepoImp(ApiService(Dio())));

      getIt.registerSingleton<AllPropertiesRepoImp>(
      AllPropertiesRepoImp(ApiService(Dio())));

      
}
