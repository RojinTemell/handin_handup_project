import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class CscPicker extends StatefulWidget {
  const CscPicker({super.key});

  @override
  State<CscPicker> createState() => _CscPickerState();
}

class _CscPickerState extends State<CscPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CSCPicker(
              // defaultCountry: CscCountry.Turkey,
              onCountryChanged: (value) {
                setState(() {
                  // countryValue = value;
                });
              },
              onStateChanged: (value) {
                setState(() {
                  // stateValue = value;
                });
              },
              onCityChanged: (value) {
                setState(() {
                  // cityValue = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // if (formKey.currentState!.validate()) {}
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        backgroundColor:const Color.fromARGB(255, 228, 82, 9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child:const Text(
                        'Send',
                        style:
                             TextStyle(fontSize: 18, color: Colors.white),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
