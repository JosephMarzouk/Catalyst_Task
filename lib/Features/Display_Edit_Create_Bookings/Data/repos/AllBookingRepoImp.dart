import 'package:catalyst_technical_task/Features/Display_Edit_Create_Bookings/Data/repos/AllBookingRepo.dart';
import 'package:catalyst_technical_task/core/APIservice.dart';

import '../models/booking_model/booking_model.dart';

class AllBookingRepoImp implements AllBookingRepo {
  final ApiService apiService;
  AllBookingRepoImp(this.apiService);

  @override
  Future<List<BookingModel>> getAllBookings() async {
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
  Future<List<BookingModel>> deleteBookings({required String id}) async{
     try {
      var data = await apiService.delete(endPoint: 'users', id: id);
      print(data);
      return (data as List).map((e) => BookingModel.fromJson(e)).toList();
    } catch (e) {
      print(e);

      rethrow;
    }
  }

  @override
  Future<List<BookingModel>> updateBookings(
      {required Map<String, dynamic> body,required String id})async {
    try {
      var data = await apiService.edit(endPoint: 'users', id: id,body: body);
      print(data);
      return (data as List).map((e) => BookingModel.fromJson(e)).toList();
    } catch (e) {
      print(e);

      rethrow;
    }
  }

  @override
  Future<List<BookingModel>> createBooking(
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
}
