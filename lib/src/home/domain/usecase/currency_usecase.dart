import 'package:dartz/dartz.dart';
import 'package:swypex/src/home/data/repository/repository_currency.dart';

import '../../../../core/error/faliure.dart';
import '../../data/model/country_model.dart';
import '../../data/model/currency_model.dart';

class CurrencyUsecase {
  final RepositoryCurrency repositoryCurrency;
  CurrencyUsecase(this.repositoryCurrency);
  Future<Either<Failure, List<CurrencyModel>>> getCurrency(
          {required String startDate,
          required String endDate,
          required String base,
          required String symbols}) =>
      repositoryCurrency.getCurrency(
          startDate: startDate, endDate: endDate, base: base, symbols: symbols);
  Future<Either<Failure, CountryModel>> getCountriesList() =>
      repositoryCurrency.getCountriesList();
}
