import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({super.key});

  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  void initState() {
    super.initState();

    // Initialize Firebase
    initializeFirebase();

    // Add a delay of 5 seconds
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, '/signin');
    });
  }

  void initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.4, 0.7, 0.9],
            colors: [
              const Color(0xFFCE93D8).withOpacity(0.8),
              const Color(0xFFBA68C8).withOpacity(0.8),
              const Color(0xFFBA68C8),
              const Color(0xFFBA68C8),
            ],
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color(0x000fffff).withOpacity(0.2),
              BlendMode.dstATop,
            ),
            image: const AssetImage("assets/login_screen_pic.png"),
          ),
        ),
                child: const Center(
                  child: SingleChildScrollView(
                    child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             //app name
                         Text(
                        'Bookie',
                         textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 0.5,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          ),
                          ),
                             //Subtitle
                             Text(
                               'Dive into the World of Infinite Stories!',
                               textAlign: TextAlign.start,
                               overflow: TextOverflow.ellipsis,
                               style: TextStyle(
                                 color: Colors.white,
                                 fontStyle: FontStyle.italic,
                                 letterSpacing: 0.5,
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold,
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
