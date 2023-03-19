part of 'currency_bloc.dart';

abstract class CurrencyState extends Equatable {
  const CurrencyState();
}

class CurrencyInitial extends CurrencyState {
  @override
  List<Object> get props => [];
}

class CurrencyField extends CurrencyState {
  final ErrorModel errorModel;

  const CurrencyField(this.errorModel);
  @override
  List<Object> get props => [errorModel];
}

class CurrencySuccess extends CurrencyState {
  final List<CurrencyModel> currencies;
  const CurrencySuccess(this.currencies);
  @override
  List<Object> get props => [currencies];
}

class CurrencyLoading extends CurrencyState {
  @override
  List<Object> get props => [];
}

class CurrencyOffline extends CurrencyState {
  @override
  List<Object> get props => [];
}

class UpdateCurrencies extends CurrencyState {
  final List<CurrencyModel> currencies;
  const UpdateCurrencies(this.currencies);
  @override
  List<Object> get props => [currencies];
}

class UpdatePreviewCurrencies extends CurrencyState {
  final List<CurrencyModel> currencies;
  const UpdatePreviewCurrencies(this.currencies);
  @override
  List<Object> get props => [currencies];
}
