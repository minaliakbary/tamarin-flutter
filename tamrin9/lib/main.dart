

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
      title: 'Shopping List',
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
  List<String> shoppingList = [];

  TextEditingController controller = TextEditingController();

  // اضافه کردن کالا به لیست
  void addItem() {
    String item = controller.text.trim();

    if (item.isNotEmpty) {
      setState(() {
        shoppingList.add(item);
      });

      controller.clear();
    }
  }

  // حذف کالا از لیست
  void removeItem(int index) {
    setState(() {
      shoppingList.removeAt(index);
    });
  }

  // نمایش لیست نهایی
  void showFinalList() {
    String result = shoppingList.isEmpty
        ? 'لیست خرید خالی است!'
        : shoppingList.join('\n');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('لیست خرید نهایی'),
          content: Text(result),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('بستن'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لیست خرید من'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            // فیلد ورود کالا
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'نام کالا را وارد کنید',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            // دکمه اضافه کردن
            ElevatedButton(
              onPressed: addItem,
              child: const Text('اضافه کردن کالا'),
            ),

            const SizedBox(height: 20),

            const Text(
              'اقلام لیست خرید:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // نمایش اقلام لیست
            Expanded(
              child: ListView.builder(
                itemCount: shoppingList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(shoppingList[index]),

                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        removeItem(index);
                      },
                    ),
                  );
                },
              ),
            ),

            // نمایش لیست نهایی
            ElevatedButton(
              onPressed: showFinalList,
              child: const Text('نمایش لیست خرید نهایی'),
            ),
          ],
        ),
      ),
    );
  }
}
