import 'package:dartz/dartz.dart';
import 'package:swypex/src/home/data/model/currency_model.dart';
import 'package:swypex/src/home/data/datasource/data_source.dart';
import 'package:swypex/src/home/domain/repository/base_repository.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/faliure.dart';
import '../../../../core/network/network_checker.dart';
import '../model/country_model.dart';

class RepositoryCurrency extends BaseRepository {
  final DataSourceCurrency dataSourceCurrency;
  final NetworkChecker networkChecker;
  RepositoryCurrency(this.dataSourceCurrency, this.networkChecker);
  @override
  Future<Either<Failure, List<CurrencyModel>>> getCurrency(
      {required String startDate,
      required String endDate,
      required String base,
      required String symbols}) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final response = await dataSourceCurrency.getCurrencyList(
            startDate: startDate,
            endDate: endDate,
            base: base,
            symbols: symbols);
        return Right(response);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      } on ExceptionServiceAuthentication catch (e) {
        return Left(FailureServiceAuthorized(msg: e.error));
      } on ExceptionService {
        return Left(FailureService());
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, CountryModel>> getCountriesList() async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final response = await dataSourceCurrency.getCountriesList();
        return Right(response);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      } on ExceptionServiceAuthentication catch (e) {
        return Left(FailureServiceAuthorized(msg: e.error));
      } on ExceptionService {
        return Left(FailureService());
      }
    } else {
      return Left(FailureOffline());
    }
  }
}
