import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Login_Feature/login.dart';
import 'Login_Feature/registration_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseOptions options = const FirebaseOptions(
    appId: '1:1014651146431:android:08e43aec476db73bd2f60a',
    apiKey: 'AIzaSyDt1ba8t3dXrJe8fC-SK-61JPD2WdcfFI8',
    messagingSenderId: '1014651146431',
    projectId: 'bookiee-300cc',
  );
  await Firebase.initializeApp(options: options);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/', // You can set the initial route if needed
      routes: {
        '/': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),


        // Add more routes as needed
      },

    );
  }
}
