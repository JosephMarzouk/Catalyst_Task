import 'package:bloc/bloc.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Bookings/Data/models/booking_model/booking_model.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Bookings/Data/repos/AllBookingRepo.dart';
import 'package:equatable/equatable.dart';

part 'all_booking_state.dart';

class AllBookingCubit extends Cubit<AllBookingState> {
  AllBookingCubit(this.allBookingRepo) : super(AllBookingInitial());

  final AllBookingRepo allBookingRepo;

  Future<void> getAllBookings() async {
    try {
      emit(AllBookingLoading());
      final bookings = await allBookingRepo.getAllBookings();
      print(bookings);
      emit(AllBookingSucess(bookings: bookings));
    } catch (e) {
      emit(AllBookingFailuer(error: e.toString()));
    }
  }

  Future<void> createBooking({required Map<String, dynamic> body}) async {
    try {
      emit(CreateBookingLoading());
      final booking = await allBookingRepo.createBooking(body: body);
      print(booking);
      emit(CreateBookingSucsess());
    } catch (e) {
      emit(CreateBookingFailure(error: e.toString()));
    }
  }

  Future<void> deleteBooking({required String id}) async {
    try {
      emit(DeleteBookingLoading());
      final booking = await allBookingRepo.deleteBookings(id: id);
      print(booking);
      emit(DeleteBookingSucsess());
    } catch (e) {
      emit(DeleteBookingFailure(error: e.toString()));
    }
  }

   Future<void> editBooking({required Map<String, dynamic> body,required String id}) async {
    try {
      emit(UpdateBookingLoading());
      final booking = await allBookingRepo.updateBookings(body: body,id: id);
      print(booking);
      emit(UpdateBookingSucsess());
    } catch (e) {
      emit(UpdateBookingFailure(error: e.toString()));
    }
  }
}
