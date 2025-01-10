import 'package:catalyst_technical_task/Features/AllUsers/Data/repos/AllUsersRepoImp.dart';
import 'package:catalyst_technical_task/core/APIservice.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void SetupServiceLocator() {
  getIt.registerSingleton<AllUsersRepoImp>(AllUsersRepoImp(ApiService(Dio())));
  // getIt.registerFactory<SubjectBloc>(()=>SubjectBloc());
}
