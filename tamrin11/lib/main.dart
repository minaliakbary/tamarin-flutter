


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
      home: PricePage(),
    );
  }
}

class PricePage extends StatefulWidget {
  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  final TextEditingController priceController =
      TextEditingController();

  List<double> prices = [];
  List<int> expensiveIndexes = [];
  List<int> cheapIndexes = [];

  double limit = 100000;
  double total = 0;

  // تابع دریافت قیمت و دسته بندی محصولات
  void calculatePrices() {
    double? price = double.tryParse(priceController.text);

    if (price == null || price <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('لطفاً قیمت معتبر و بزرگتر از صفر وارد کنید'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      prices.add(price);

      int index = prices.length - 1;

      if (price > limit) {
        expensiveIndexes.add(index);
      } else {
        cheapIndexes.add(index);
      }

      total = 0;

      for (int i in expensiveIndexes) {
        total += prices[i];
      }

      priceController.clear();
    });
  }

  @override
  void dispose() {
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('محاسبه قیمت محصولات'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const Text(
              'قیمت محصول را وارد کنید:',
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'قیمت (تومان)',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: calculatePrices,
              child: const Text('ثبت قیمت'),
            ),

            const SizedBox(height: 15),

            Text(
              'حد مشخص: ${limit.toStringAsFixed(0)} تومان',
              style: const TextStyle(fontSize: 16),
            ),

            const Divider(height: 30),

            // لیست محصولات گران تر
            const Text(
              'محصولات بالاتر از حد مشخص:',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: expensiveIndexes.length,
                itemBuilder: (context, index) {
                  int productIndex = expensiveIndexes[index];

                  return ListTile(
                    leading: const Icon(
                      Icons.shopping_bag,
                      color: Colors.green,
                    ),
                    title: Text('محصول ${productIndex + 1}'),
                    subtitle: Text(
                      '${prices[productIndex].toStringAsFixed(0)} تومان',
                    ),
                    trailing: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                  );
                },
              ),
            ),

            const Divider(),

            // لیست محصولات ارزان تر
            const Text(
              'محصولات پایین تر یا مساوی حد مشخص:',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: cheapIndexes.length,
                itemBuilder: (context, index) {
                  int productIndex = cheapIndexes[index];

                  return ListTile(
                    leading: const Icon(
                      Icons.shopping_bag,
                      color: Colors.orange,
                    ),
                    title: Text('محصول ${productIndex + 1}'),
                    subtitle: Text(
                      '${prices[productIndex].toStringAsFixed(0)} تومان',
                    ),
                    trailing: const Icon(
                      Icons.info,
                      color: Colors.orange,
                    ),
                  );
                },
              ),
            ),

            // نمایش مجموع
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    'مجموع قیمت محصولات بالاتر از حد:',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${total.toStringAsFixed(0)} تومان',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
