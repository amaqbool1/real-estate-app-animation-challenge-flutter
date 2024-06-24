import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardSuccess extends DashboardState {
  final int selectedIndex;

  const DashboardSuccess(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
