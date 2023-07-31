import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:get/get.dart';
import 'package:currency_converter_v2/controller/controllers.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController usdController = TextEditingController();
  final TextEditingController slrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Currrency Converter',
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
            Text(
              'United States Dollar equals ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '330.37 Sri Lankan Rupee',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(height: 50),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black,
                    child: TextField(
                      controller: usdController,
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
                        CurrencyConverter.convertToLKR(value);
                        slrController.text = CurrencyConverter.results.value;
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      color: Colors.black,
                      child: Text(
                        'United States Dollar',
                        style: TextStyle(
                          color: Colors.grey[300],
                          backgroundColor: Colors.black,
                        ),
                      )),
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
                      controller: slrController,
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
                        CurrencyConverter.convertToUSD(value);
                        usdController.text = CurrencyConverter.results.value;
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      color: Colors.black,
                      child: Text(
                        'Sri Lankan Rupees',
                        style: TextStyle(
                          color: Colors.grey[300],
                          backgroundColor: Colors.black,
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
