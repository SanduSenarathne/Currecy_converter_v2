import 'package:get/get.dart';

class CurrencyConverter {
  static RxString results = ''.obs;
  static RxString conversionRate = ''.obs;
  static RxDouble exchangeRateUR = 319.11.obs;
  static RxDouble exchangeRateUY = 7.19.obs;
  static RxDouble exchangeRateYR = 44.37.obs;
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
    results.value = result.toStringAsFixed(4);
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
    results.value = result.toStringAsFixed(4);
  }

  static String exchangeRate(
      String selectdCurrency1, String selectedCurrency2) {
    if (selectdCurrency1 == 'United States Dollar' &&
        selectedCurrency2 == 'Sri Lankan Rupees') {
      return '316.14';
    } else if (selectdCurrency1 == 'United States Dollar' &&
        selectedCurrency2 == 'Chinese Yuan') {
      return '7.17';
    } else if (selectdCurrency1 == 'Sri Lankan Rupees' &&
        selectedCurrency2 == 'Chinese Yuan') {
      return '0.023';
    } else if (selectdCurrency1 == 'Sri Lankan Rupees' &&
        selectedCurrency2 == 'United States Dollar') {
      return '0.0032';
    } else if (selectdCurrency1 == 'Chinese Yuan' &&
        selectedCurrency2 == 'Sri Lankan Rupees') {
      return '44.19';
    } else if (selectdCurrency1 == 'Chinese Yuan' &&
        selectedCurrency2 == 'United States Dollar') {
      return '0.14';
    } else {
      return '1.0';
    }
  }
}
