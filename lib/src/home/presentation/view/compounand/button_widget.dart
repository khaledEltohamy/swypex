import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swypex/core/compounand/dialog/dialog_app.dart';
import 'package:swypex/core/error/error_model.dart';

import '../../../../../core/compounand/button/button_app.dart';
import '../../../../../core/compounand/loading/loading_widget.dart';
import '../../bloc/currency_bloc/currency_bloc.dart';
import '../../bloc/currrency_cubit/base_cubit.dart';
import '../../bloc/currrency_cubit/symbols_cubit.dart';

class ButtonWidget extends StatelessWidget {
  final TextEditingController startEditing, endEditing;
  const ButtonWidget(
      {super.key, required this.startEditing, required this.endEditing});

  @override
  Widget build(BuildContext context) {
    var selectedBase = context.watch<BaseCubit>().selectedCountry;
    var selectedSymbole = context.watch<SymbolsCubit>().selectedCountry;
    return BlocBuilder<CurrencyBloc, CurrencyState>(builder: (context, state) {
      if (state is CurrencyLoading) {
        return const ButtonLoading(title: "إنشاء حساب");
      } else {
        return Center(
            child: ButtonApp(
                minWidth: 100,
                maxWidth: 120,
                minHeight: 42,
                maxHeight: 52,
                title: "SUBMIT",
                onTap: () {
                  if (DateUtils.isSameDay(DateTime.parse(startEditing.text),
                      DateTime.parse(endEditing.text))) {
                    BaseDialog.showAlertDialog(
                        context,
                        ErrorModel(
                            title: "Date Time Not Correct",
                            contant:
                                "End date time must not be at the same day with  Start date time"),
                        "image",
                        () => null);
                  }
                  if (DateTime.parse(startEditing.text)
                      .isAfter(DateTime.parse(endEditing.text))) {
                    BaseDialog.showAlertDialog(
                        context,
                        ErrorModel(
                            title: "Date Time Not Correct",
                            contant:
                                "End date time must not be after Start date time"),
                        "image",
                        () => null);
                  } else {
                    BlocProvider.of<CurrencyBloc>(context).add(
                        GetCurrenciesList(startEditing.text, endEditing.text,
                            selectedBase ?? "", selectedSymbole ?? ""));
                  }
                }));
      }
    });
  }
}
