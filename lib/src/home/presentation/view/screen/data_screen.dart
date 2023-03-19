import 'package:auto_size_text/auto_size_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:swypex/core/datetime/textfield_datetime.dart';
import 'package:swypex/core/compounand/loading/loading_text.dart';
import 'package:swypex/src/home/presentation/bloc/currrency_cubit/symbols_cubit.dart';
import 'package:swypex/src/home/presentation/view/compounand/button_widget.dart';
import 'package:swypex/src/home/presentation/view/compounand/list_widget.dart';
import 'package:swypex/src/home/presentation/view/widget/animated_list.dart';

import '../../../../../core/compounand/button/button_app.dart';
import '../../../../../core/compounand/loading/loading_widget.dart';
import '../../../data/model/currency_model.dart';
import '../../bloc/currrency_cubit/base_cubit.dart';
import '../../bloc/currency_bloc/currency_bloc.dart';
import '../../bloc/stepper_cubit.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  TextEditingController startDateTextController = TextEditingController();
  TextEditingController endDateTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var index = context.watch<StepperCubit>().indexStep;
    var indecator = context.watch<StepperCubit>().indicatorLength;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 60),
          _filterDateSection(
            context,
            startDateTextController,
            endDateTextController,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                index >= indecator - 1
                    ? Container()
                    : _nextStepWidget(context, true, index),
                index == 0
                    ? Container()
                    : _previewStepWidget(context, false, index),
              ],
            ),
          ),
          _indicatorPages(context),
          _pageView(context)
        ],
      ),
    );
  }
}

Widget _pageView(BuildContext context) {
  var index = context.watch<StepperCubit>().indexStep;
  var indicatorLength = context.watch<StepperCubit>().indicatorLength;
  return SizedBox(
    height: 400,
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: indicatorLength,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 400,
            child: Column(
              children: [
                Container(height: 1, color: Colors.black),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Date"),
                      Text("From"),
                      Text("To"),
                      Text("Price"),
                    ],
                  ),
                ),
                Container(
                    height: 1, width: double.infinity, color: Colors.black),
                const SizedBox(height: 8),
                BlocConsumer<CurrencyBloc, CurrencyState>(
                  listener: (context, state) {
                    if (state is CurrencySuccess) {
                      BlocProvider.of<StepperCubit>(context)
                          .incresIndecator(state.currencies);
                      BlocProvider.of<StepperCubit>(context).initStep(0);
                    }
                  },
                  builder: (context, state) {
                    if (state is CurrencyOffline) {
                      return const Center(
                        child: Text(" Your are in offline mode"),
                      );
                    }
                    if (state is UpdateCurrencies) {
                      return ListAnimationWidget(currencies: state.currencies);
                    }
                    if (state is UpdatePreviewCurrencies) {
                      return ListAnimationWidget(currencies: state.currencies);
                    }
                    if (state is CurrencySuccess) {
                      List<CurrencyModel> list = [];
                      if (state.currencies.length >= 10) {
                        list = List.from(state.currencies.sublist(0, 10));
                      } else {
                        list = List.from(state.currencies);
                      }
                      return ListAnimationWidget(currencies: list);
                    } else if (state is CurrencyLoading) {
                      return const LoadingTextWidget(
                          withText: false, color: Colors.black);
                    } else {
                      return Container();
                    }
                  },
                ),
                const SizedBox(height: 50),
              ],
            ),
          );
        }),
  );
}

_nextStepWidget(BuildContext context, bool visible, int index) {
  var step = context.watch<StepperCubit>().indexStep;
  var totalIndex = context.watch<StepperCubit>().indicatorLength;
  return InkWell(
    onTap: () {
      BlocProvider.of<StepperCubit>(context).onNextStep(step);
      BlocProvider.of<CurrencyBloc>(context).add(UpdateCurrenciesList(
          totalList: [],
          currentList: [],
          currentIndex: index,
          totalIndex: totalIndex));
    },
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(16)),
      child: const Center(
          child: RotatedBox(
        quarterTurns: 2,
        child: Icon(
          Icons.forward,
          size: 20,
          color: Colors.blue,
        ),
      )),
    ),
  );
}

_previewStepWidget(BuildContext context, bool visible, int indexArg) {
  var index = context.watch<StepperCubit>().indexStep;
  var totat = context.watch<StepperCubit>().indicatorLength;
  return InkWell(
    onTap: () {
      BlocProvider.of<StepperCubit>(context).onPreviewStep(index);
      BlocProvider.of<CurrencyBloc>(context).add(UpdatePreviewCurrenciesList(
          totalList: [],
          currentList: [],
          currentIndex: indexArg,
          totalIndex: totat));
    },
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(16)),
      child: const Center(
          child: Icon(
        Icons.forward,
        size: 20,
        color: Colors.blue,
      )),
    ),
  );
}

_indicatorPages(BuildContext context) {
  var index = context.watch<StepperCubit>().indexStep;
  var length = context.watch<StepperCubit>().indicatorLength;
  return RotatedBox(
    quarterTurns: 2,
    child: DotsIndicator(
      dotsCount: length != 0 ? length : 1,
      position: index.toDouble(),
      decorator: DotsDecorator(
        color: Colors.grey,
        activeColor: Colors.blue.shade700,
        size: const Size.square(9.0),
        activeSize: const Size(30.0, 9.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    ),
  );
}

_filterDateSection(
  BuildContext context,
  TextEditingController startEditing,
  TextEditingController endEditing,
) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFieldStartDateTimeWidget(
              textEditingController: startEditing,
              label: 'Start Date',
            ),
            const SizedBox(width: 10),
            TextFieldEndDateTimeWidget(
              textEditingController: endEditing,
              label: "End Date",
            ),
          ],
        ),
        const SizedBox(height: 100),
        ButtonWidget(startEditing: startEditing, endEditing: endEditing)
      ],
    ),
  );
}
