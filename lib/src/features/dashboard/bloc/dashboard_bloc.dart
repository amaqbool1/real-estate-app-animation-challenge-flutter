import 'package:bloc/bloc.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) {
      if (event is NavigateTo) {
        emit(DashboardSuccess(event.index));
      }
    });
  }
}
