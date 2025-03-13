part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeSuccess extends HomeState {

  final List<Customer> customers;

  HomeSuccess({required this.customers});
}
final class HomeFauler extends HomeState {
 
 final String err;

  HomeFauler({required this.err});
 

}
final class HomeNotAllow extends HomeState {}
