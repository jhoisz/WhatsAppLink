import 'package:flutter/material.dart';
import 'package:wpplink/screens/wpp_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Link',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const WppForm(),
    );
  }
}
