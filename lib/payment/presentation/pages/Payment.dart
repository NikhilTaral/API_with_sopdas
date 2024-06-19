import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:project/theme/colors.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String? _selectedMethod;
  final List<String> _paymentMethods = ['Card', 'Net Banking', 'UPI'];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isLargeScreen = screenWidth > 800;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              navigator!.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          color: AppColors.light,
          child: Row(
            children: [
              // Left side illustration
              if (isLargeScreen)
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Image.asset('assets/images/index.png'),
                  ),
                ),
              // Right side registration form
              Expanded(
                flex: 3,
                child: Center(
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    width: screenWidth,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                        ),
                      ),
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "SAPDOS",
                              style: TextStyle(
                                fontSize: 58,
                                fontWeight: FontWeight.w900,
                                color: AppColors.dark,
                              ),
                            ),
                            const SizedBox(height: 46),
                            const Text(
                              "Book Appointment",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: AppColors.dark,
                              ),
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              width: 290,
                              child: DropdownButtonFormField<String>(
                                value: _selectedMethod,
                                decoration: const InputDecoration(
                                  labelText: 'Payment Method',
                                  border: OutlineInputBorder(),
                                ),
                                items: _paymentMethods.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedMethod = newValue;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Select the mode of payment you prefer',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 16),
                            if (_selectedMethod == 'Card') ...[
                              const Text(
                                'Enter your details below',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: 300,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Card Number',
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: 300,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: Expanded(
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Card Holder',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    SizedBox(
                                      width: 90,
                                      child: Expanded(
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'MM/YY',
                                            border: OutlineInputBorder(),
                                          ),
                                          keyboardType: TextInputType.datetime,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'CVV',
                                          border: OutlineInputBorder(),
                                        ),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 32),
                              SizedBox(
                                width: 230,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showAlertDialog(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.dark,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Pay Now',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context) {
  // set up the AlertDialog
  AlertDialog alert = const AlertDialog(
    backgroundColor: AppColors.dark,
    icon: Icon(
      Icons.phone_android_sharp,
      color: AppColors.white,
      size: 30,
    ),
    content: Text(
      " your booking is conform",
      style: TextStyle(
          color: AppColors.white, fontSize: 30, fontWeight: FontWeight.w300),
    ),
    actions: [],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
