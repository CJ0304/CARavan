import 'package:flutter/material.dart';
import 'package:user1_bookingrepair/HomePage/home_page_screen.dart';

import '../register/sign_up_screen.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgotPass> {
  final TextEditingController emailController = TextEditingController();
  bool isChecked = false;
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                "Forgot Password",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: const Text("Code Sent"),
                              content: const Text(
                                  "Password Reset Code was Sent to Email."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    emailController.clear();
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            ));
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
                    "Send Password Reset Code",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
