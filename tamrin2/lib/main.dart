


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// کلاس اطلاعات سن
class AgeInfo {
  int years;
  int months;
  int days;

  AgeInfo({
    required this.years,
    required this.months,
    required this.days,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'محاسبه سن',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
        ),
        useMaterial3: true,
      ),
      home: const AgePage(),
    );
  }
}

class AgePage extends StatefulWidget {
  const AgePage({super.key});

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  DateTime? birthDate;
  AgeInfo? result;

  // تابع انتخاب تاریخ تولد
  Future<void> selectDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      setState(() {
        birthDate = selectedDate;
        result = calculateAge(selectedDate);
      });
    }
  }

  // تابع محاسبه سن
  AgeInfo calculateAge(DateTime birth) {
    DateTime today = DateTime.now();

    int years = today.year - birth.year;
    int months = today.month - birth.month;
    int days = today.day - birth.day;

    // اصلاح تعداد روزها
    if (days < 0) {
      months--;

      int previousMonthDays =
          DateTime(today.year, today.month, 0).day;

      days += previousMonthDays;
    }

    // اصلاح تعداد ماه‌ها
    if (months < 0) {
      years--;
      months += 12;
    }

    return AgeInfo(
      years: years,
      months: months,
      days: days,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('محاسبه سن'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.cake,
                  size: 80,
                  color: Colors.deepPurple,
                ),

                const SizedBox(height: 20),

                const Text(
                  'تاریخ تولد خود را انتخاب کنید',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: selectDate,
                  icon: const Icon(Icons.calendar_month),
                  label: const Text('انتخاب تاریخ تولد'),
                ),

                const SizedBox(height: 30),

                if (birthDate != null && result != null)
                  Card(
                    elevation: 4,
                    color: Colors.deepPurple.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          const Text(
                            'سن شما برابر است با:',
                            style: TextStyle(fontSize: 18),
                          ),

                          const SizedBox(height: 20),

                          Text(
                            '${result!.years} سال',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),

                          Text(
                            '${result!.months} ماه و ${result!.days} روز',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
