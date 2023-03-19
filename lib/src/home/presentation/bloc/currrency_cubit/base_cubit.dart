import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swypex/src/home/data/model/country_model.dart';

class BaseCubit extends Cubit<String?> {
  String? selectedCountry;

  BaseCubit(super.initialState);

  void getSelectedArea(String? countryModel) {
    if (countryModel != null) {
      selectedCountry = countryModel;
      emit(selectedCountry!);
    } else {
      selectedCountry = null;
      emit(selectedCountry);
    }
  }
}
