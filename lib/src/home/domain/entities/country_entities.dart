import 'package:equatable/equatable.dart';

abstract class CountryEntities extends Equatable {
  final List<String> countries;

  CountryEntities(this.countries);
}
