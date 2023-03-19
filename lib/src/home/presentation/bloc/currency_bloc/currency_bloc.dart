import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:swypex/core/error/error_model.dart';
import 'package:swypex/src/home/data/model/currency_model.dart';
import 'package:swypex/src/home/data/repository/repository_currency.dart';
import 'package:swypex/src/home/domain/usecase/currency_usecase.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyUsecase repositoryCurrency;
  List<CurrencyModel> currentList = [];
  List<CurrencyModel> totalList = [];
  CurrencyBloc(this.repositoryCurrency) : super(CurrencyInitial()) {
    on<GetCurrenciesList>((event, emit) => _handelGetCurrencies(event, emit));
    on<UpdateCurrenciesList>(
        (event, emit) => _handelUpdateCurrencies(event, emit));
    on<UpdatePreviewCurrenciesList>(
        (event, emit) => _handelUpdatePreviewCurrencies(event, emit));
  }

  _handelGetCurrencies(
      GetCurrenciesList event, Emitter<CurrencyState> emit) async {
    emit(CurrencyLoading());
    final result = await repositoryCurrency.getCurrency(
        startDate: event.startDate,
        endDate: event.endDate,
        base: event.base,
        symbols: event.symbols);
    result.fold((l) => emit(CurrencyField(ErrorModel.convertFailureError(l))),
        (r) {
      totalList = List.from(r);
      emit(CurrencySuccess(totalList));
    });
  }

  _handelUpdateCurrencies(
      UpdateCurrenciesList event, Emitter<CurrencyState> emit) {
    List<CurrencyModel> list = [];
    int pageLenght = 10;
    int current = event.currentIndex + 1;
    if (current == event.totalIndex - 1) {
      list = List.from(
          totalList.getRange((current * pageLenght), totalList.length));
      emit(UpdateCurrencies(list));
    } else {
      list = List.from(totalList.getRange(
          (current * pageLenght), ((current * pageLenght) + pageLenght)));
      emit(UpdateCurrencies(list));
    }
  }

  _handelUpdatePreviewCurrencies(
      UpdatePreviewCurrenciesList event, Emitter<CurrencyState> emit) {
    List<CurrencyModel> list = [];
    int pageLenght = 10;
    int current = event.currentIndex - 1;
    if (current == 0) {
      list = List.from(totalList.getRange(0, 10));
      emit(UpdateCurrencies(list));
    } else {
      if (current + 1 == event.totalIndex) {
        list = List.from(
            totalList.getRange((current * pageLenght), totalList.length));
        emit(UpdateCurrencies(list));
      } else {
        list = List.from(totalList.getRange(
            (current * pageLenght), ((current * pageLenght) + pageLenght)));
        emit(UpdateCurrencies(list));
      }
    }
  }
}
