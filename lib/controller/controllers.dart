import 'package:get/get.dart';

class CurrencyConverter {
  static RxString results = ''.obs;
  static RxDouble exchangeRateUR = 330.37.obs;
  static RxDouble exchangeRateUY = 7.16.obs;
  static RxDouble exchangeRateYR = 44.18.obs;
  static RxDouble inputAmount = 0.0.obs;
  static RxDouble result = 0.0.obs;

  static void convertToCurencyText1(
      String inputValue, String selectdCurrency1, String selectedCurrency2) {
    try {
      inputAmount.value = double.parse(inputValue);
    } catch (e) {
      results.value = 'Invalid Input';
      return;
    }

    if (selectdCurrency1 == 'United States Dollar' &&
        selectedCurrency2 == 'Sri Lankan Rupees') {
      result.value = inputAmount.value * exchangeRateUR.value;
    } else if (selectdCurrency1 == 'United States Dollar' &&
        selectedCurrency2 == 'Chinese Yuan') {
      result.value = inputAmount.value * exchangeRateUY.value;
    } else if (selectdCurrency1 == 'Chinese Yuan' &&
        selectedCurrency2 == 'Sri Lankan Rupees') {
      result.value = inputAmount.value * exchangeRateYR.value;
    } else if (selectdCurrency1 == 'Sri Lankan Rupees' &&
        selectedCurrency2 == 'United States Dollar') {
      result.value = inputAmount.value / exchangeRateUR.value;
    } else if (selectdCurrency1 == 'Chinese Yuan' &&
        selectedCurrency2 == 'United States Dollar') {
      result.value = inputAmount.value / exchangeRateUY.value;
    } else if (selectdCurrency1 == 'Sri Lankan Rupees' &&
        selectedCurrency2 == 'Chinese Yuan') {
      result.value = inputAmount.value / exchangeRateYR.value;
    } else {
      result.value = inputAmount.value;
    }
    results.value = result.toStringAsFixed(2);
  }

  static void convertToCurencyText2(
      String inputValue, String selectdCurrency1, String selectedCurrency2) {
    try {
      inputAmount.value = double.parse(inputValue);
    } catch (e) {
      results.value = 'Invalid Input';
      return;
    }

    if (selectdCurrency1 == 'United States Dollar' &&
        selectedCurrency2 == 'Sri Lankan Rupees') {
      result.value = inputAmount.value / exchangeRateUR.value;
    } else if (selectdCurrency1 == 'United States Dollar' &&
        selectedCurrency2 == 'Chinese Yuan') {
      result.value = inputAmount.value / exchangeRateUY.value;
    } else if (selectdCurrency1 == 'Chinese Yuan' &&
        selectedCurrency2 == 'Sri Lankan Rupees') {
      result.value = inputAmount.value / exchangeRateYR.value;
    } else if (selectdCurrency1 == 'Sri Lankan Rupees' &&
        selectedCurrency2 == 'United States Dollar') {
      result.value = inputAmount.value * exchangeRateUR.value;
    } else if (selectdCurrency1 == 'Chinese Yuan' &&
        selectedCurrency2 == 'United States Dollar') {
      result.value = inputAmount.value * exchangeRateUY.value;
    } else if (selectdCurrency1 == 'Sri Lankan Rupees' &&
        selectedCurrency2 == 'Chinese Yuan') {
      result.value = inputAmount.value * exchangeRateYR.value;
    } else {
      result.value = inputAmount.value;
    }
    results.value = result.toStringAsFixed(2);
  }
}
