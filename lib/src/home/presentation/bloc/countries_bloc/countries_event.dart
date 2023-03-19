part of 'countries_bloc.dart';

abstract class CountriesEvent extends Equatable {
  const CountriesEvent();

  @override
  List<Object> get props => [];
}

class GetCountriesList extends CountriesEvent {}

class GetSearchList extends CountriesEvent {
  final String query;

  const GetSearchList(this.query);
}
