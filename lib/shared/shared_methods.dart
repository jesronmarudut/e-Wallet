import 'package:another_flushbar/flushbar.dart';
import 'package:bank/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

void showCustomSnackbar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: const Duration(seconds: 2),
  ).show(context);
}

String formatCurrency(
  num number, {
  String symbol = 'Rp ',
}) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: symbol,
    decimalDigits: 0,
  ).format(number);
}

Future<XFile?> selectImage() async {
  XFile? selectedImage = await ImagePicker().pickImage(
    source: ImageSource.gallery,
  );

  return selectedImage;
}

String dateToMonthDate(DateTime date) {
  return DateFormat('EEE, d MMMM y').format(date);
}

String formatTransactionCurrency(num number) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: '',
    decimalDigits: 0,
  ).format(number);
}
