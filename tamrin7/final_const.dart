
void main() {
  // تفاوت final و const در زبان Dart

  // 1. متغیر final
  // مقدار آن فقط یک بار تعیین می‌شود.
  // مقدار final می‌تواند هنگام اجرای برنامه مشخص شود.

  final String userName = "Mel";
  final int age = 21;

  // 2. متغیر const
  // مقدار آن باید از قبل و در زمان کامپایل مشخص باشد.
  // مقدار const قابل تغییر نیست.

  const double pi = 3.14;
  const String country = "Iran";

  // نمایش اطلاعات
  print("----- Final Variables -----");
  print("User Name: $userName");
  print("Age: $age");

  print("\n----- Const Variables -----");
  print("Pi: $pi");
  print("Country: $country");

  // تفاوت مهم:
  // final می‌تواند مقدار را در زمان اجرا دریافت کند.
  // const فقط مقدار ثابت زمان کامپایل را می‌پذیرد.
}
