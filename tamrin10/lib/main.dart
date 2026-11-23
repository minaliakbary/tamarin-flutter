
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
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  // تابع شمارنده با حفظ مقدار قبلی
  Function counter() {
    int count = 0;

    return () {
      count++;
      return count;
    };
  }

  late final Function getCounter;

  @override
  void initState() {
    super.initState();
    getCounter = counter();
  }

  int result = 0;

  void increaseCounter() {
    setState(() {
      result = getCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persistent Counter'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            Text(
              '$result',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: increaseCounter,
              child: const Text('Increase Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
