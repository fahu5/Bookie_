import 'package:flutter/material.dart';
import '../Core/Animation/fade_animation.dart';

enum FormData {
  email,
  password,
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool isPasswordVisible = true;
  FormData? selected;


TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              const Color(0xFF4b4293).withOpacity(0.8),
              const Color(0xFF4b4293),
              const Color(0xFF08418e),
              const Color(0xFF08418e),
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  color: const Color(0xFFabd3fa).withOpacity(0.4),
                  child: Container(
                    width: 400,
                    padding: const EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeAnimation(
                          delay: 1.0,
                          child: Image.asset(
                            "assets/login_screen_pic.png",
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                          const FadeAnimation(
                          delay: 1.0,
                          child: Text(
                            "Please sign in to continue",
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: emailController,
                          onTap: (){
                            setState(() {
                              selected=FormData.email;
                            });
                          },
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: selected == FormData.email
                                  ? enabledtxt
                                  : deaible,
                              size: 20,
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: selected == FormData.email
                                  ? enabledtxt
                                  : deaible,
                              fontSize: 12,
                            ),
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: selected == FormData.email
                                ? enabledtxt
                                : deaible,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        TextField(
                          controller: passwordController,
                          onTap: () {
                            setState(() {
                              selected = FormData.password;
                            });
                          },
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.lock_open_outlined,
                              color: selected == FormData.password
                                  ? enabledtxt
                                  : deaible,
                              size: 20,
                            ),
                            suffixIcon: IconButton(
                              icon: isPasswordVisible
                                  ? Icon(
                                Icons.visibility_off,
                                color: selected == FormData.password
                                    ? enabledtxt
                                    : deaible,
                                size: 20,
                              )
                                  : Icon(
                                Icons.visibility,
                                color: selected == FormData.password
                                    ? enabledtxt
                                    : deaible,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: selected == FormData.password
                                  ? enabledtxt
                                  : deaible,
                              fontSize: 12,
                            ),
                          ),
                          obscureText: !isPasswordVisible,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: selected == FormData.password
                                ? enabledtxt
                                : deaible,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            // Implement your login logic here
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFF2697FF),
                            padding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 0.5,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ... Rest of your code ...
              ],
            ),
          ),
        ),
      ),
    );
  }
}
