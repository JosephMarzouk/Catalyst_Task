import 'package:catalyst_technical_task/Features/AllBookings/Data/repos/AllBookingRepo.dart';
import 'package:catalyst_technical_task/core/APIservice.dart';

import '../models/booking_model/booking_model.dart';

class AllBookingRepoImp implements AllBookingRepo {
  final ApiService apiService;
  AllBookingRepoImp(this.apiService);

  @override
  Future<List<BookingModel>> createBookings(
      {required Map<String, dynamic> body}) async {
    try {
      var data = await apiService.post(endPoint: 'bookings', body: body);
      print(data);
      return (data as List).map((e) => BookingModel.fromJson(e)).toList();
    } catch (e) {
      print(e);

      rethrow;
    }
  }


  @override
  Future<List<BookingModel>> getAllBookings() async{
   try {
      var data = await apiService.get(endPoint: 'users');
      List<BookingModel> bookings = [];
      for (var user in data) {
        bookings.add(BookingModel.fromJson(user));
      }
      return bookings;
    } catch (e) {
      print(e);

      rethrow;
    }
  }
  
  @override
  Future<List<BookingModel>> deleteBookings() {
    // TODO: implement deleteBookings
    throw UnimplementedError();
  }
  
  @override
  Future<List<BookingModel>> updateBookings({required Map<String, dynamic> body}) {
    // TODO: implement updateBookings
    throw UnimplementedError();
  }
  }


  
