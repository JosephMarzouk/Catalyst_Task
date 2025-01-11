import 'package:bloc/bloc.dart';
import 'package:catalyst_technical_task/Features/AllBookings/Data/models/booking_model/booking_model.dart';
import 'package:catalyst_technical_task/Features/AllBookings/Data/repos/AllBookingRepo.dart';
import 'package:equatable/equatable.dart';

part 'all_booking_state.dart';

class AllBookingCubit extends Cubit<AllBookingState> {
  AllBookingCubit(this.allBookingRepo) : super(AllBookingInitial());

  final AllBookingRepo allBookingRepo;

   Future <void> getAllBookings() async {
    try {
      emit(AllBookingLoading());
      final bookings = await allBookingRepo.getAllBookings();
      print(bookings);
      emit(AllBookingSucess(bookings: bookings));
    } catch (e) {
      emit(AllBookingFailuer(error: e.toString()));
    }
  }
}
