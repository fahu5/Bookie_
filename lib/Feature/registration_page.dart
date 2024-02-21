import 'package:flutter/material.dart';
import '../Core/Animation/fade_animation.dart';
import 'login.dart';

enum FormData{
  name,
  email,
  gender,
  password,
  confirmPassword,
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState  extends State<SignupScreen>{
  Color enabled = const Color(0xFF454A64);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFFBA68CF).withOpacity(0.9);

  bool isPasswordev = true;

  FormData? selected;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                       fontWeight: FontWeight.bold
                          ),

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
                           const SizedBox( height: 20, ),
                           FadeAnimation(
                               delay: 1,
                               child: Container(
                                 width: 300,
                                 height: 45,
                                 decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                   color: selected == FormData.name
                                     ? enabled
                                     : backgroundColor,
                                 ),
                                 padding: const EdgeInsets.all(5.0),
                                 child: TextField(
                                   controller: nameController,
                                   onTap: (){
                                     setState(() {
                                       selected = FormData.name;
                                     });
                                   },
                                   decoration: InputDecoration(
                                     enabledBorder: InputBorder.none,
                                     border: InputBorder.none,
                                     prefixIcon: Icon(
                                       Icons.supervised_user_circle_outlined,
                                       color: selected == FormData.name
                                         ? enabledtxt
                                           : deaible,
                                       size:20,
                                     ),
                                     hintText: 'Username',
                                     hintStyle: TextStyle(
                                       color: selected == FormData.name
                                           ? enabledtxt
                                           :deaible,
                                       fontSize: 14
                                     ),
                                   ),
                                   textAlignVertical: TextAlignVertical.center,
                                   style: TextStyle(
                                     color: selected == FormData.name
                                         ? enabledtxt
                                         :deaible,
                                      // fontWeight: FontWeight.bold,
                                       fontSize: 14
                                   ),
                                 ),
                               ),
                           ),
                           const SizedBox( height: 20,),
                              FadeAnimation(
                                delay: 1,
                                child: Container(
                                  width: 300,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: selected == FormData.email
                                        ? enabled
                                        : backgroundColor,
                                  ),
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextField(
                                    controller: emailController,
                                    onTap: (){
                                      setState(() {
                                        selected = FormData.email;
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
                                        size:20,
                                      ),
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                          color: selected == FormData.email
                                              ? enabledtxt
                                              :deaible,
                                          fontSize: 12
                                      ),
                                    ),
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        color: selected == FormData.email
                                            ? enabledtxt
                                            :deaible,
                                       // fontWeight: FontWeight.bold,
                                        fontSize: 14
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox( height: 20,),

                              FadeAnimation(
                                delay: 1,
                                child: Container(
                                  width: 300,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: selected == FormData.password
                                        ? enabled
                                        : backgroundColor
                                  ),
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextField(
                                    controller: passwordController,
                                    onTap: (){
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
                                        size:20,
                                      ),
                                      suffixIcon: IconButton(
                                          icon: isPasswordev
                                        ? Icon(
                                          Icons.visibility_off,
                                            color: selected == FormData.password
                                                ? enabledtxt
                                                : deaible,
                                            size:20,
                                      )
                                          :Icon(
                                            Icons.visibility,
                                            color: selected == FormData.password
                                                ? enabledtxt
                                                : deaible,
                                            size:20,
                                          ),
                                        onPressed: () => setState(
                                                () => isPasswordev = !isPasswordev),
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                          color: selected == FormData.password
                                              ? enabledtxt
                                              :deaible,
                                          fontSize: 12
                                      ),
                                    ),
                                    obscureText: isPasswordev,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        color: selected == FormData.password
                                            ? enabledtxt
                                            :deaible,
                                       // fontWeight: FontWeight.bold,
                                        fontSize: 14
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox( height: 20,),

                              FadeAnimation(
                                delay: 1,
                                child: Container(
                                  width: 300,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: selected == FormData.confirmPassword
                                        ? enabled
                                        : backgroundColor,
                                  ),
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextField(
                                    controller: confirmPasswordController,
                                    onTap: (){
                                      setState(() {
                                        selected = FormData.confirmPassword;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.lock_open_outlined,
                                        color: selected == FormData.confirmPassword
                                            ? enabledtxt
                                            : deaible,
                                        size:20,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: isPasswordev
                                            ? Icon(
                                          Icons.visibility_off,
                                          color: selected == FormData.confirmPassword
                                              ? enabledtxt
                                              : deaible,
                                          size:20,
                                        )
                                            :Icon(
                                          Icons.visibility,
                                          color: selected == FormData.confirmPassword
                                              ? enabledtxt
                                              : deaible,
                                          size:20,
                                        ),
                                        onPressed: () => setState(
                                                () => isPasswordev = !isPasswordev),
                                      ),
                                      hintText: 'Confirm password',
                                      hintStyle: TextStyle(
                                          color: selected == FormData.confirmPassword
                                              ? enabledtxt
                                              :deaible,
                                          fontSize: 12
                                      ),
                                    ),
                                    obscureText: isPasswordev,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        color: selected == FormData.confirmPassword
                                            ? enabledtxt
                                            :deaible,
                                        //fontWeight: FontWeight.bold,
                                        fontSize: 14
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox( height: 25,),
                          FadeAnimation(
                            delay: 1,
                            child: TextButton(
                             onPressed: () {},
                             style: TextButton.styleFrom(
                                 backgroundColor: const Color(0xFF91D3B9),
                                 padding: const EdgeInsets.symmetric(
                                     vertical: 14.0, horizontal: 80),
                                 shape: RoundedRectangleBorder(
                                     borderRadius:
                                     BorderRadius.circular(12.0))),
                             child:  const Text(
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

                   ) ,
                 const SizedBox( height: 20,),
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
}

