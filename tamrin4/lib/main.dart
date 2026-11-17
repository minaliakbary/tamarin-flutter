

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
      title: 'Student Information',
      home: const StudentPage(),
    );
  }
}

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final averageController = TextEditingController();

  String result = '';

  void checkStudent() {
    String name = nameController.text;
    int? age = int.tryParse(ageController.text);
    double? average = double.tryParse(averageController.text);

    if (name.isEmpty || age == null || average == null ||
        average < 0 || average > 20 || age <= 0) {
      setState(() {
        result = 'لطفاً اطلاعات معتبر وارد کنید!';
      });
      return;
    }

    setState(() {
      if (average >= 10) {
        result = 'نام: $name\nسن: $age\nمعدل: $average\nوضعیت: قبول شده';
      } else {
        result = 'نام: $name\nسن: $age\nمعدل: $average\nوضعیت: مردود شده';
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    averageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اطلاعات دانش آموز'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'نام دانش آموز',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'سن دانش آموز',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: averageController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'معدل دانش آموز',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: checkStudent,
              child: const Text('بررسی وضعیت دانش آموز'),
            ),

            const SizedBox(height: 25),

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
      ),
    );
  }
}
