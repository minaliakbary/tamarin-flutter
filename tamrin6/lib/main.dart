
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PasswordPage(),
    );
  }
}

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final TextEditingController passwordController =
      TextEditingController();

  final TextEditingController inputController =
      TextEditingController();

  String password = '';
  String message = '';
  bool passwordEntered = false;

  void checkPassword() {
    setState(() {
      if (inputController.text == password) {
        message = 'رمز درست است';
      } else {
        message = 'رمز نادرست است';
      }
    });
  }

  void savePassword() {
    if (passwordController.text.isEmpty) return;

    setState(() {
      password = passwordController.text;
      passwordEntered = true;
      message = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Checker'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (!passwordEntered) ...[
              const Text('یک رمز عبور انتخاب کنید'),

              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'رمز عبور',
                  border: OutlineInputBorder(),
                ),
              ),

              ElevatedButton(
                onPressed: savePassword,
                child: const Text('ذخیره رمز'),
              ),
            ] else ...[
              const Text('رمز عبور را وارد کنید'),

              TextField(
                controller: inputController,
                decoration: const InputDecoration(
                  hintText: 'رمز را وارد کنید',
                  border: OutlineInputBorder(),
                ),
              ),

              ElevatedButton(
                onPressed: checkPassword,
                child: const Text('بررسی رمز'),
              ),

              const SizedBox(height: 20),

              Text(
                message,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
