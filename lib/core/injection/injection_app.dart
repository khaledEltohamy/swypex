import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:swypex/src/home/data/datasource/data_source.dart';
import 'package:swypex/src/home/data/repository/repository_currency.dart';
import 'package:swypex/src/home/domain/usecase/currency_usecase.dart';
import 'package:swypex/src/home/presentation/bloc/countries_bloc/countries_bloc.dart';

import '../../src/home/presentation/bloc/currency_bloc/currency_bloc.dart';
import '../../src/home/presentation/bloc/currrency_cubit/base_cubit.dart';
import '../../src/home/presentation/bloc/currrency_cubit/symbols_cubit.dart';
import '../../src/home/presentation/bloc/search_cubit/searchbar_base_cubit.dart';
import '../../src/home/presentation/bloc/search_cubit/searchbar_symblo_cubit.dart';
import '../../src/home/presentation/bloc/stepper_cubit.dart';
import '../network/network_checker.dart';

final getIt = GetIt.instance;

Future<void> init() async {
//Cubits - Blocs - View Models

  getIt.registerFactory(() => CurrencyBloc(getIt()));
  getIt.registerFactory(() => CountriesBloc(getIt()));
  getIt.registerFactory(() => StepperCubit());
  getIt.registerFactory(() => SearchBarBaseCubit(false));
  getIt.registerFactory(() => SearchBarSymbolCubit(false));
  getIt.registerFactory(() => BaseCubit(null));
  getIt.registerFactory(() => SymbolsCubit(null));

//============================================================================//

//Repositories

  getIt.registerLazySingleton<RepositoryCurrency>(
      () => RepositoryCurrency(getIt(), getIt()));

//============================================================================//
//UseCases
  getIt.registerLazySingleton<CurrencyUsecase>(() => CurrencyUsecase(getIt()));
//============================================================================//
//DataSource
  getIt.registerLazySingleton<DataSourceCurrency>(
      () => DataSourceCurrency()); //Races DataSource

//============================================================================//
//Core
  getIt.registerLazySingleton<NetworkChecker>(
      () => NetworkChecker(internetConnectionChecker: getIt()));

//============================================================================//
//Extra Injection
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
