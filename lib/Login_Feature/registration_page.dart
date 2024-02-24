import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Core/Animation/fade_animation.dart';
import 'login.dart';

enum FormData {
  name,
  email,
  gender,
  password,
  confirmPassword,
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Color enabled = const Color(0xFF454A64);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.white70;
  Color backgroundColor = const Color(0xFFBA68CF).withOpacity(0.9);

  bool isPasswordVisible = true;

  FormData? selected;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void handleSignup() async {
    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Save additional user information to Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': nameController.text,
        'email': emailController.text,
        'gender': genderController.text,
        'password': passwordController.text,
        'confirmPassword': confirmPasswordController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Signup Successful!'),
          duration: Duration(seconds: 3),
        ),
      );

      // Navigate to the login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } catch (e) {
      // Handle registration errors
      "Error during registration: $e";
      // Show an error message or handle as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bookie',
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 0.5,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Card(
                  elevation: 5,
                  color: const Color(0xFFCE93D8).withOpacity(0.4),
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
                        FadeAnimation(
                          delay: 1,
                          child: Text(
                            "Create your account",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                letterSpacing: 0.5),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        buildInputField(
                          controller: nameController,
                          hint: 'Username',
                          icon: Icons.supervised_user_circle_outlined,
                          type: FormData.name,
                        ),
                        const SizedBox(height: 20,),
                        buildInputField(
                          controller: emailController,
                          hint: 'Email',
                          icon: Icons.email_outlined,
                          type: FormData.email,
                        ),
                        const SizedBox(height: 20,),
                        buildPasswordInputField(
                          controller: passwordController,
                          hint: 'Password',
                          type: FormData.password,
                        ),
                        const SizedBox(height: 20,),
                        buildPasswordInputField(
                          controller: confirmPasswordController,
                          hint: 'Confirm password',
                          type: FormData.confirmPassword,
                        ),
                        const SizedBox(height: 25,),
                        FadeAnimation(
                          delay: 1,
                          child: TextButton(
                            onPressed: () => handleSignup(),
                            style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF91D3B9),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14.0, horizontal: 80),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(12.0))),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 0.5,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                FadeAnimation(
                  delay: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("If you have an account. ",
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 0.5,
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const LoginScreen();
                          }));
                        },
                        child: const Text(
                            "Sing in",
                            style: TextStyle(
                                color: Color(0xFF91D3B4),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required FormData type,
  }) {
    return FadeAnimation(
      delay: 1,
      child: Container(
        width: 300,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: selected == type ? enabled : backgroundColor,
        ),
        padding: const EdgeInsets.all(5.0),
        child: TextField(
          controller: controller,
          onTap: () {
            setState(() {
              selected = type;
            });
          },
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
              color: selected == type ? enabledtxt : deaible,
              size: 20,
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: selected == type ? enabledtxt : deaible,
              fontSize: 14,
            ),
          ),
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
            color: selected == type ? enabledtxt : deaible,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget buildPasswordInputField({
    required TextEditingController controller,
    required String hint,
    required FormData type,
  }) {
    return FadeAnimation(
      delay: 1,
      child: Container(
        width: 300,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: selected == type ? enabled : backgroundColor,
        ),
        padding: const EdgeInsets.all(5.0),
        child: TextField(
          controller: controller,
          onTap: () {
            setState(() {
              selected = type;
            });
          },
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.lock_open_outlined,
              color: selected == type ? enabledtxt : deaible,
              size: 20,
            ),
            suffixIcon: IconButton(
              icon: isPasswordVisible
                  ? Icon(
                Icons.visibility_off,
                color: selected == type ? enabledtxt : deaible,
                size: 20,
              )
                  : Icon(
                Icons.visibility,
                color: selected == type ? enabledtxt : deaible,
                size: 20,
              ),
              onPressed: () =>
                  setState(() => isPasswordVisible = !isPasswordVisible),
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: selected == type ? enabledtxt : deaible,
              fontSize: 12,
            ),
          ),
          obscureText: isPasswordVisible,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
            color: selected == type ? enabledtxt : deaible,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
