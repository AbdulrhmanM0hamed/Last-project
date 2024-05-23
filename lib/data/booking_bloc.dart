import 'package:flutter_bloc/flutter_bloc.dart';

class BookingBloc extends Cubit<bool> {
  BookingBloc() : super(false);

  void setHasAppointment(bool value) {
    emit(value);
  }
}
