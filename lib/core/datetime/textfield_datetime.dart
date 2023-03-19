import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../validation/validations.dart';

class TextFieldEndDateTimeWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final DateTime? selectedDate;
  final String label;
  const TextFieldEndDateTimeWidget(
      {super.key,
      required this.textEditingController,
      this.selectedDate,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          isDense: true,
          // errorText: errors ?? errors,
          hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
              fontSize: 14),
          labelStyle: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w500,
              fontSize: 16),
          errorStyle: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.w500, fontSize: 10),
          hintTextDirection: TextDirection.ltr,
          hintText: "DD / MM / YY",
          labelText: label,
          prefixIconConstraints:
              const BoxConstraints(minWidth: 40, maxWidth: 60),
          prefixIcon: const Icon(Icons.date_range),
          // prefixStyle: TextStyle(locale: AppLocale.of(context).locale),
          // suffixIcon: suffixIcon, //Adding Suffix Icon to password Form
        ),
        textInputAction: TextInputAction.next,
        // label: hint ?? AppLocale.of(context).getTranslation("date_of_birth"),
        // withPrefixIcon: true,
        // errors: map != null ? _checkErrorMassage(map, 'birth_date') : null,
        readOnly: true,
        validator: (_) =>
            Validations.validateBirthdate(textEditingController.text),
        onTap: () => showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(1920),
          lastDate: DateTime(20200),
        ).then((value) {
          textEditingController.text = value.toString().substring(0, 10);
        }),
      ),
    );
  }
}

class TextFieldStartDateTimeWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final DateTime? selectedDate;
  final String label;
  const TextFieldStartDateTimeWidget(
      {super.key,
      required this.textEditingController,
      this.selectedDate,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          isDense: true,
          // errorText: errors ?? errors,
          hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
              fontSize: 14),
          labelStyle: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w500,
              fontSize: 16),
          errorStyle: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.w500, fontSize: 10),
          hintTextDirection: TextDirection.ltr,
          hintText: "DD / MM / YY",
          labelText: label,
          prefixIconConstraints:
              const BoxConstraints(minWidth: 40, maxWidth: 60),
          prefixIcon: const Icon(Icons.date_range),
          // prefixStyle: TextStyle(locale: AppLocale.of(context).locale),
          // suffixIcon: suffixIcon, //Adding Suffix Icon to password Form
        ),
        textInputAction: TextInputAction.next,
        // label: hint ?? AppLocale.of(context).getTranslation("date_of_birth"),
        // withPrefixIcon: true,
        // errors: map != null ? _checkErrorMassage(map, 'birth_date') : null,
        readOnly: true,
        validator: (_) =>
            Validations.validateBirthdate(textEditingController.text),
        onTap: () => showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(1920),
          lastDate: DateTime(20200),
        ).then((value) {
          textEditingController.text = value.toString().substring(0, 10);
        }),
      ),
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}
