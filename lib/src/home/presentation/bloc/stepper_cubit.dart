import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swypex/src/home/data/model/currency_model.dart';

class StepperCubit extends Cubit<int> {
  int indexStep = 0;
  int indicatorLength = 1;
  StepperCubit() : super(0);
  incresIndecator(List<CurrencyModel> lenght) {
    List lst = lenght;
    var chunks = [];
    int chunkSize = 10;
    for (var i = 0; i < lst.length; i += chunkSize) {
      chunks.add(lst.sublist(
          i, i + chunkSize > lst.length ? lst.length : i + chunkSize));
    }
    indicatorLength = chunks.length;
    emit(indicatorLength);
  }

  lenghtOfList(List<CurrencyModel> list) {
    int current = 0;
    int next = 0;
    int last = indicatorLength;
    if (last < 10) {
      current = list.length;
    } else {
      next = 10;
      list.getRange(current, next);
      current = 10;
    }
  }

  onNextStep(int index) {
    if (index < indicatorLength) {
      indexStep = index + 1;
      emit(indexStep);
    }
  }

  initStep(int index) {
    indexStep = index;
    emit(indexStep);
  }

  onPreviewStep(int index) {
    if (index > 0) {
      indexStep = index - 1;
      emit(indexStep);
    }
  }

  onTapSetp(int index) {
    indexStep = index;
    emit(indexStep);
  }
}
