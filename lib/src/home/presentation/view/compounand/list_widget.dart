import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:swypex/src/home/data/model/currency_model.dart';

class ListAnimationWidget extends StatelessWidget {
  final List<CurrencyModel> currencies;
  const ListAnimationWidget({super.key, required this.currencies});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: AnimationLimiter(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 1000),
                      childAnimationBuilder: (widget) => SlideAnimation(
                            horizontalOffset: 50.0,
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          ),
                      children: [
                        SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: currencies.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: 120,
                                            child: Text(
                                                currencies[index].currentDate)),
                                        SizedBox(
                                            width: 110,
                                            child:
                                                Text(currencies[index].from)),
                                        SizedBox(
                                            width: 50,
                                            child: Text(currencies[index].to)),
                                        const Spacer(),
                                        currencies[index].price["USD"] == null
                                            ? const SizedBox(
                                                width: 60,
                                                child: Text("          - -"))
                                            : index != 0
                                                ? SizedBox(
                                                    width: 80,
                                                    child: double.parse(
                                                                currencies[
                                                                        index]
                                                                    .price[
                                                                        "USD"]
                                                                    .toString()) >
                                                            double.parse(
                                                                currencies[
                                                                        index -
                                                                            1]
                                                                    .price[
                                                                        "USD"]
                                                                    .toString())
                                                        ? Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .arrow_drop_up,
                                                                color: Colors
                                                                    .green
                                                                    .shade600,
                                                                size: 14,
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                    "${currencies[index].price["USD"]}"),
                                                              )
                                                            ],
                                                          )
                                                        : Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .arrow_drop_down,
                                                                color: Colors
                                                                    .red
                                                                    .shade600,
                                                                size: 14,
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                    "${currencies[index].price["USD"]}"),
                                                              )
                                                            ],
                                                          ))
                                                : Text(
                                                    "${currencies[index].price["USD"]}"),
                                      ],
                                    ),
                                    const Divider(color: Colors.black),
                                  ],
                                );
                              }),
                        ),
                      ]),
                ))));
  }
}
