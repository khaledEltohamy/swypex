part of 'countries_bloc.dart';

abstract class CountriesState extends Equatable {
  const CountriesState();
}

class CountriesInitial extends CountriesState {
  @override
  List<Object> get props => [];
}

class CountriesField extends CountriesState {
  @override
  List<Object> get props => [];
}

class CountriesSuccess extends CountriesState {
  final CountryModel countries;
  const CountriesSuccess(this.countries);

  @override
  List<Object> get props => [countries];
}

class CountriesLoading extends CountriesState {
  @override
  List<Object> get props => [];
}

class UpdateCountriesSuccess extends CountriesState {
  final List<String> compound_list;

  const UpdateCountriesSuccess(this.compound_list);
  @override
  List<Object> get props => [compound_list];
}

class CountriesOffline extends CountriesState {
  @override
  List<Object> get props => [];
}
