import 'package:dartz/dartz_unsafe.dart';
import 'package:dio/dio.dart';
import 'package:swypex/core/error/exception.dart';
import 'package:swypex/src/home/data/model/country_model.dart';
import 'package:swypex/src/home/data/model/currency_model.dart';

class DataSourceCurrency {
  late Dio dio;
  DataSourceCurrency() {
    dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 10 * 12000,
      receiveTimeout: 10 * 12000,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    ));
  }
  Future<List<CurrencyModel>> getCurrencyList(
      {required String startDate,
      required String endDate,
      required String base,
      required String symbols}) async {
    try {
      final response = await dio
          .get("https://api.exchangerate.host/timeseries", queryParameters: {
        "start_date": startDate,
        "end_date": endDate,
        "base": base,
        "symbols": symbols,
      });
      List<dynamic> valuePrice = [];
      List<String> currentDate = [];
      List<CurrencyModel> currenciesList = [];
      Map<String, dynamic> mapCurrency;
      Map<String, dynamic> map = response.data['rates'];
      for (var v in map.values) {
        valuePrice.add(v);
      }
      for (var d in map.keys) {
        currentDate.add(d);
      }
      for (var i = 0; i < currentDate.length; i++) {
        currenciesList.add(CurrencyModel.fromJson({
          "values_prices": valuePrice[i],
          "from": response.data["base"],
          "to": symbols,
          "date": currentDate[i]
        }));
      }
      return currenciesList;
      // return CurrencyModel.fromJson({
      //   "values_prices": valuePrice,
      //   "from": response.data["base"],
      //   "to": symbols,
      //   "date": currentDate
      // });
    } on DioError catch (e) {
      throw ExceptionServiceCallBack(massage: e.message);
    }
  }

  Future<CountryModel> getCountriesList() async {
    try {
      final response = await dio.get("https://api.exchangerate.host/symbols");
      List<String> countryList = [];
      Map<String, dynamic> map = response.data['symbols'];
      for (var v in map.keys) {
        countryList.add(v);
      }
      return CountryModel.fromJson({"countries": countryList});
    } on DioError catch (e) {
      throw ExceptionServiceCallBack(massage: e.message);
    }
  }
}
