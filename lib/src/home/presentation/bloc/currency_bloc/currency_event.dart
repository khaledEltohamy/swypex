part of 'currency_bloc.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();

  @override
  List<Object> get props => [];
}

class GetCurrenciesList extends CurrencyEvent {
  final String startDate;
  final String endDate;
  final String base;
  final String symbols;

  const GetCurrenciesList(
    this.startDate,
    this.endDate,
    this.base,
    this.symbols,
  );
}

class UpdateCurrenciesList extends CurrencyEvent {
  final List<CurrencyModel> totalList;
  final List<CurrencyModel> currentList;
  final int currentIndex;
  final int totalIndex;

  const UpdateCurrenciesList(
      {required this.totalList,
      required this.currentList,
      required this.currentIndex,
      required this.totalIndex});
}

class UpdatePreviewCurrenciesList extends CurrencyEvent {
  final List<CurrencyModel> totalList;
  final List<CurrencyModel> currentList;
  final int currentIndex;
  final int totalIndex;

  const UpdatePreviewCurrenciesList(
      {required this.totalList,
      required this.currentList,
      required this.currentIndex,
      required this.totalIndex});
}
