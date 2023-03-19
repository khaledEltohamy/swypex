import 'package:flutter_bloc/flutter_bloc.dart';

class SymbolsCubit extends Cubit<String?> {
  String? selectedCountry;

  SymbolsCubit(super.initialState);

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
