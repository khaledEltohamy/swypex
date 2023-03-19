import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swypex/core/injection/injection_app.dart' as di;
import 'package:swypex/src/home/presentation/bloc/currrency_cubit/base_cubit.dart';
import 'package:swypex/src/home/presentation/bloc/countries_bloc/countries_bloc.dart';
import 'package:swypex/src/home/presentation/bloc/currency_bloc/currency_bloc.dart';
import 'package:swypex/src/home/presentation/bloc/search_cubit/searchbar_base_cubit.dart';
import 'package:swypex/src/home/presentation/bloc/search_cubit/searchbar_symblo_cubit.dart';
import 'package:swypex/src/home/presentation/bloc/stepper_cubit.dart';
import 'package:swypex/src/home/presentation/bloc/currrency_cubit/symbols_cubit.dart';
import 'package:swypex/src/home/presentation/view/screen/main_screen.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.getIt<CurrencyBloc>()),
        BlocProvider(create: (_) => di.getIt<CountriesBloc>()),
        BlocProvider(create: (_) => di.getIt<StepperCubit>()),
        BlocProvider(create: (_) => di.getIt<SearchBarBaseCubit>()),
        BlocProvider(create: (_) => di.getIt<SearchBarSymbolCubit>()),
        BlocProvider(create: (_) => di.getIt<BaseCubit>()),
        BlocProvider(create: (_) => di.getIt<SymbolsCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sywpex',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MainScreen(),
      ),
    );
  }
}
