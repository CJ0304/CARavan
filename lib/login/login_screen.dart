import 'package:flutter/material.dart';
import 'package:user1_bookingrepair/HomePage/home_page_screen.dart';
import 'package:user1_bookingrepair/login/forgot_pass.dart';

import '../register/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isChecked = false;
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 223, 209),
                  Color.fromARGB(255, 207, 243, 255)
                ],
                end: Alignment.topLeft,
                begin: Alignment.bottomRight,
              ),
            ),
          ),
          // Abstract Circles
          Positioned(
            top: -100,
            left: -50,
            child: CircleAvatar(
              radius: 150,
              backgroundColor: Colors.white.withAlpha((0.2 * 255).toInt()),
            ),
          ),
          Positioned(
            bottom: -120,
            right: -70,
            child: CircleAvatar(
              radius: 180,
              backgroundColor: Colors.white.withAlpha((0.2 * 255).toInt()),
            ),
          ),
          Positioned(
            top: 100,
            right: 50,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white.withAlpha((0.2 * 255).toInt()),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset(
                      "assets/images/LogoType1.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Login to continue",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              }),
                          const Text("Remember Me"),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle forgot password
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const ForgotPass()));
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color(0xFF28435A),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle login logic
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomePageScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF28435A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SignUpScreen()));
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Color(0xFF28435A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
