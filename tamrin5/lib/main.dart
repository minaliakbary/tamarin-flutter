
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
      home: const GradePage(),
    );
  }
}

class GradePage extends StatefulWidget {
  const GradePage({super.key});

  @override
  State<GradePage> createState() => _GradePageState();
}

class _GradePageState extends State<GradePage> {
  final TextEditingController controller = TextEditingController();

  List<double> grades = [];

  double average = 0;
  int passedCount = 0;

  void calculate() {
    String input = controller.text;

    grades = input
        .split(',')
        .map((e) => double.parse(e.trim()))
        .toList();

    if (grades.isEmpty) return;

    double sum = 0;
    passedCount = 0;

    for (double grade in grades) {
      sum += grade;

      if (grade > 10) {
        passedCount++;
      }
    }

    setState(() {
      average = sum / grades.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Calculator'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'نمرات را با کاما وارد کنید:',
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'مثلا: 15, 18, 9, 12, 20',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calculate,
              child: const Text('محاسبه'),
            ),

            const SizedBox(height: 30),

            Text('میانگین نمرات: ${average.toStringAsFixed(2)}'),

            const SizedBox(height: 15),

            Text('تعداد نمرات بالاتر از ۱۰: $passedCount'),

            const SizedBox(height: 15),

            Text('تعداد کل نمرات: ${grades.length}'),
          ],
        ),
      ),
    );
  }
}
