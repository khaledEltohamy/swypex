import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:swypex/src/home/data/model/country_model.dart';
import 'package:swypex/src/home/data/repository/repository_currency.dart';
import 'package:swypex/src/home/domain/usecase/currency_usecase.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final CurrencyUsecase repositoryCurrency;
  List<String> list_compound = [];
  CountriesBloc(this.repositoryCurrency) : super(CountriesInitial()) {
    on<GetCountriesList>((event, emit) => _handelGetCurrencies(event, emit));
    on<GetSearchList>((event, emit) => _getAreaSuggestionHandler(event, emit));
  }

  _handelGetCurrencies(
      GetCountriesList event, Emitter<CountriesState> emit) async {
    emit(CountriesLoading());
    final result = await repositoryCurrency.getCountriesList();
    result.fold((l) => emit(CountriesField()), (r) {
      list_compound = List.from(r.countries);
      emit(CountriesSuccess(r));
    });
  }

  Future<void> _getAreaSuggestionHandler(
      GetSearchList event, Emitter<CountriesState> emit) async {
    List<String> list = [];
    final listSuggestion =
        list_compound.where((element) => element.contains(event.query));
    list = List.from(listSuggestion);
    emit(UpdateCountriesSuccess(list));
  }
}
