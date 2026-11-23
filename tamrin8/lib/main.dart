


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
      title: 'Final and Const',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    // Final example
    final String name = 'Mel';
    final DateTime currentTime = DateTime.now();

    // Const example
    const int age = 20;
    const double pi = 3.14;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Final و Const در Dart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink.shade100,
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              const Icon(
                Icons.code,
                size: 70,
                color: Colors.pink,
              ),

              const SizedBox(height: 15),

              const Text(
                'تفاوت متغیر Final و Const',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              // Final section
              Card(
                color: Colors.pink.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        '1. Final',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        'متغیر Final فقط یک بار مقداردهی می‌شود '
                        'و بعد از آن نمی‌توان مقدار جدیدی به آن اختصاص داد. '
                        'اما مقدار آن می‌تواند هنگام اجرای برنامه مشخص شود.',
                        style: TextStyle(fontSize: 15),
                      ),

                      const Divider(),

                      Text('نام: $name'),
                      Text('زمان فعلی: $currentTime'),

                      const SizedBox(height: 10),

                      const Text(
                        "مثال در Dart:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      const Text(
                        "final String name = 'Mel';",
                        style: TextStyle(
                          fontFamily: 'monospace',
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Const section
              Card(
                color: Colors.blue.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        '2. Const',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        'متغیر Const باید از همان زمان کامپایل '
                        'مقدار مشخص و ثابتی داشته باشد. '
                        'مقدار آن در طول برنامه قابل تغییر نیست.',
                        style: TextStyle(fontSize: 15),
                      ),

                      const Divider(),

                      Text('سن: $age'),
                      Text('عدد پی: $pi'),

                      const SizedBox(height: 10),

                      const Text(
                        'مثال در Dart:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      const Text(
                        'const int age = 20;',
                        style: TextStyle(
                          fontFamily: 'monospace',
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: const Column(
                  children: [
                    Text(
                      'نتیجه گیری',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Final: مقدار فقط یک بار تعیین می‌شود، '
                      'اما می‌تواند در زمان اجرای برنامه مشخص شود.\n\n'
                      'Const: مقدار باید از قبل و در زمان کامپایل مشخص باشد.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
