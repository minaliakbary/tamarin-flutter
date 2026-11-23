
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('محاسبه تخفیف'),
          centerTitle: true,
        ),
        body: Center(
          child: DiscountCalculator(),
        ),
      ),
    );
  }
}

class DiscountCalculator extends StatefulWidget {
  const DiscountCalculator({super.key});

  @override
  State<DiscountCalculator> createState() =>
      _DiscountCalculatorState();
}

class _DiscountCalculatorState extends State<DiscountCalculator> {
  final TextEditingController priceController =
      TextEditingController();

  final TextEditingController discountController =
      TextEditingController();

  String result = '';

  void calculateDiscount() {
    // دریافت اطلاعات به صورت رشته
    String priceText = priceController.text;
    String discountText = discountController.text;

    // تبدیل رشته به عدد
    double price = double.parse(priceText);
    double discount = double.parse(discountText);

    // محاسبه مبلغ تخفیف
    double discountAmount = price * discount / 100;

    // محاسبه قیمت نهایی
    double finalPrice = price - discountAmount;

    setState(() {
      result = 'مبلغ تخفیف: $discountAmount تومان\n'
          'مبلغ نهایی: $finalPrice تومان';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: priceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'قیمت محصول',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          TextField(
            controller: discountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'درصد تخفیف',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: calculateDiscount,
            child: const Text('محاسبه تخفیف'),
          ),

          const SizedBox(height: 20),

          Text(
            result,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
