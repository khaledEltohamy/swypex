import 'package:swypex/src/home/domain/entities/currency_entities.dart';

class CurrencyModel extends CurrencyEntities {
  CurrencyModel(
      {required super.from,
      required super.startDate,
      required super.endDate,
      required super.to,
      required super.price,
      required super.currentDate});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
      from: json["from"],
      startDate: "startDate",
      endDate: "endDate",
      to: json["to"],
      price: json["values_prices"],
      currentDate: json["date"]);

  @override
  List<Object?> get props => [];
}
