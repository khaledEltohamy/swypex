import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/faliure.dart';
import '../../data/model/country_model.dart';
import '../../data/model/currency_model.dart';

abstract class BaseRepository extends Equatable {
  Future<Either<Failure, List<CurrencyModel>>> getCurrency(
      {required String startDate,
      required String endDate,
      required String base,
      required String symbols});
  Future<Either<Failure, CountryModel>> getCountriesList();
  @override
  List<Object?> get props => [];
}
