import 'package:electromart/Admin/addProduct.dart';
import 'package:electromart/Admin/admin.dart';
import 'package:electromart/pages/bottomnav.dart';
import 'package:electromart/pages/home.dart';
import 'package:electromart/pages/loginpage.dart';
import 'package:electromart/pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Electromart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Addproduct(),
    );
  }
}
