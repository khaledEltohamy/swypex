import 'package:equatable/equatable.dart';

abstract class CurrencyEntities extends Equatable {
  final String currentDate;
  final String startDate;
  final String endDate;
  final String from;
  final String to;
  final dynamic price;

  CurrencyEntities(
      {required this.from,
      required this.startDate,
      required this.endDate,
      required this.to,
      required this.price,
      required this.currentDate});
}
