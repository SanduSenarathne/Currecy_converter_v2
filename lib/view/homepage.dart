import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:currency_converter_v2/controller/controllers.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  static ValueNotifier<String> selectedCurrency1 =
      ValueNotifier('Sri Lankan Rupees');
  static ValueNotifier<String> selectedCurrency2 =
      ValueNotifier('United States Dollar');

  List<String> currencyList = [
    'United States Dollar',
    'Sri Lankan Rupees',
    'Chinese Yuan'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Currency Converter',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder<String>(
              valueListenable: selectedCurrency1,
              builder: (context, value, child) {
                return Text(
                  '1 $value equals ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                );
              },
            ),
            SizedBox(height: 8),
            ValueListenableBuilder<String>(
              valueListenable: selectedCurrency2,
              builder: (context, value, child) {
                String formattedExchangeRate = CurrencyConverter.exchangeRate(
                  selectedCurrency1.value,
                  selectedCurrency2.value,
                );
                return Text(
                  '$formattedExchangeRate ${selectedCurrency2.value}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            Container(height: 50),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black,
                    child: TextField(
                      controller: controller1,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}?$'),
                        ),
                      ],
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: 'Enter value',
                        hintStyle: TextStyle(color: Colors.grey[300]),
                        filled: true,
                        fillColor: Colors.black,
                      ),
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        controller2.clear();
                        CurrencyConverter.convertToCurencyText1(
                          value,
                          selectedCurrency1.value,
                          selectedCurrency2.value,
                        );
                        controller2.text = CurrencyConverter.results.value;
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black,
                    child: ValueListenableBuilder<String>(
                      valueListenable: selectedCurrency1,
                      builder: (context, value, child) {
                        return DropdownButton<String>(
                          value: value,
                          dropdownColor: Colors.black,
                          onChanged: (newValue1) {
                            controller1.clear();
                            controller2.clear();
                            /*CurrencyConverter.exchangeRate(
                                selectedCurrency1.value,
                                selectedCurrency2.value);*/
                            selectedCurrency1.value = newValue1!;
                          },
                          items: currencyList.map((currency) {
                            return DropdownMenuItem<String>(
                              value: currency,
                              child: Text(
                                currency,
                                style: TextStyle(
                                  color: Colors.grey[300],
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Container(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black,
                    child: TextField(
                      controller: controller2,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}?$'),
                        ),
                      ],
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: 'Enter Value',
                        hintStyle: TextStyle(color: Colors.grey[300]),
                        filled: true,
                        fillColor: Colors.black,
                      ),
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        controller1.clear();
                        CurrencyConverter.convertToCurencyText2(
                          value,
                          selectedCurrency1.value,
                          selectedCurrency2.value,
                        );
                        controller1.text = CurrencyConverter.results.value;
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black,
                    child: ValueListenableBuilder<String>(
                      valueListenable: selectedCurrency2,
                      builder: (context, value, child) {
                        return DropdownButton<String>(
                          value: value,
                          dropdownColor: Colors.black,
                          onChanged: (newValue2) {
                            controller1.clear();
                            controller2.clear();
                            /*CurrencyConverter.exchangeRate(
                                selectedCurrency1.value,
                                selectedCurrency2.value);*/
                            selectedCurrency2.value = newValue2!;
                          },
                          items: currencyList.map((currency) {
                            return DropdownMenuItem<String>(
                              value: currency,
                              child: Text(
                                currency,
                                style: TextStyle(
                                  color: Colors.grey[300],
                                  backgroundColor: Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
