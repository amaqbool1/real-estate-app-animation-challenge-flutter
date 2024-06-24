import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class NavigateTo extends DashboardEvent {
  final int index;

  const NavigateTo(this.index);

  @override
  List<Object> get props => [index];
}
