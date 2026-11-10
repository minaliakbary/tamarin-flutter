


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// کلاس محصول
class Product {
  String name;
  int quantity;
  bool isBought;

  Product({
    required this.name,
    required this.quantity,
    this.isBought = false,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'لیست خرید',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        useMaterial3: true,
      ),
      home: const ShoppingPage(),
    );
  }
}

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController quantityController =
      TextEditingController();

  // لیست محصولات
  List<Product> products = [];

  // تابع اضافه کردن محصول
  void addProduct() {
    String name = nameController.text;
    int? quantity = int.tryParse(quantityController.text);

    if (name.isEmpty || quantity == null || quantity <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('نام و تعداد معتبر وارد کنید'),
        ),
      );
      return;
    }

    Product newProduct = Product(
      name: name,
      quantity: quantity,
    );

    setState(() {
      products.add(newProduct);
    });

    nameController.clear();
    quantityController.clear();
  }

  // تابع محاسبه مجموع تعداد محصولات با حلقه for
  int calculateTotal() {
    int total = 0;

    for (int i = 0; i < products.length; i++) {
      total += products[i].quantity;
    }

    return total;
  }

  // تابع تغییر وضعیت خرید
  void changeStatus(int index) {
    setState(() {
      products[index].isBought =
          !products[index].isBought;
    });
  }

  // تابع حذف محصول
  void deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('لیست خرید من'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'نام کالا',
                  prefixIcon: Icon(Icons.shopping_bag),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'تعداد',
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: addProduct,
                  icon: const Icon(Icons.add),
                  label: const Text('افزودن به لیست'),
                ),
              ),

              const SizedBox(height: 16),

              Card(
                color: Colors.teal.shade50,
                child: ListTile(
                  leading: const Icon(
                    Icons.shopping_cart,
                    color: Colors.teal,
                  ),
                  title: const Text('مجموع تعداد کالاها'),
                  trailing: Text(
                    '${calculateTotal()}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: products.isEmpty
                    ? const Center(
                        child: Text('هنوز کالایی اضافه نشده است'),
                      )
                    : ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          Product product = products[index];

                          return Card(
                            child: ListTile(
                              leading: Checkbox(
                                value: product.isBought,
                                onChanged: (value) {
                                  changeStatus(index);
                                },
                              ),

                              title: Text(
                                product.name,
                                style: TextStyle(
                                  decoration: product.isBought
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),

                              subtitle: Text(
                                'تعداد: ${product.quantity}',
                              ),

                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  deleteProduct(index);
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
