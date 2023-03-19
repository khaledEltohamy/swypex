import 'package:swypex/src/home/domain/entities/country_entities.dart';

class CountryModel extends CountryEntities {
  CountryModel(super.countries);

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      CountryModel(json["countries"]);

  @override
  List<Object?> get props => [countries];
}
