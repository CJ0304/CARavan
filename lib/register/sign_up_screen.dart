import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../login/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  XFile? _profileImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _profileImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 238, 231),
                  Color.fromARGB(255, 231, 249, 255)
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
          // Scrollable Content
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new)),
                    const Text(
                      "Create Account",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ProfileImagePicker(
                    pickImage: _pickImage, profileImage: _profileImage),
                const SizedBox(height: 20),
                CustomTextField(
                    controller: nameController,
                    label: "Full Name",
                    icon: Icons.person),
                const SizedBox(height: 20),
                CustomTextField(
                    controller: emailController,
                    label: "Email",
                    icon: Icons.email),
                const SizedBox(height: 20),
                CustomTextField(
                    controller: passwordController,
                    label: "Password",
                    icon: Icons.lock,
                    obscureText: true),
                const SizedBox(height: 30),
                const Text("Choose your main service to offer",
                    style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                RedirectUser1Button(),
                const SizedBox(height: 10),
                RedirectUser2Button(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RedirectUser1Button extends StatelessWidget {
  const RedirectUser1Button({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const RoleSpecificForm(role: "Buy/Sell/Rent"),
            ),
          );
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
          "Buy/Sell/Rent",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class RedirectUser2Button extends StatelessWidget {
  const RedirectUser2Button({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF28435A),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const RoleSpecificForm(role: "Car Repair Shop"),
            ),
          );
        },
        child: const Text(
          "Car Repair Shop",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class ProfileImagePicker extends StatelessWidget {
  final VoidCallback pickImage;
  final XFile? profileImage;

  const ProfileImagePicker({
    super.key,
    required this.pickImage,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickImage,
      child: CircleAvatar(
        radius: 50,
        backgroundImage:
            profileImage != null ? FileImage(File(profileImage!.path)) : null,
        child: profileImage == null
            ? const Icon(Icons.camera_alt, size: 40)
            : null,
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
    );
  }
}

class RoleSpecificForm extends StatefulWidget {
  final String role;

  const RoleSpecificForm({super.key, required this.role});

  @override
  _RoleSpecificFormState createState() => _RoleSpecificFormState();
}

class _RoleSpecificFormState extends State<RoleSpecificForm> {
  late Map<String, bool> options;

  @override
  void initState() {
    super.initState();
    if (widget.role == "Buy/Sell/Rent") {
      options = {
        "Buy a Car": false,
        "Sell a Car": false,
        "Rent a Car": false,
        "Browse Options": false,
      };
    } else if (widget.role == "Car Repair Shop") {
      options = {
        "Engine Repair": false,
        "Body Works": false,
        "Car Accessories": false,
        "Maintenance and Servicing": false,
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Additional Details")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Role-Specific Details for ${widget.role}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              widget.role == " Buy/Sell/Rent "
                  ? "I am here mainly to..."
                  : "My services offerings icludes...",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...options.keys.map((String key) {
              return CheckboxListTile(
                title: Text(key),
                value: options[key],
                onChanged: (bool? value) {
                  setState(() {
                    options[key] = value!;
                  });
                },
              );
            }),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // final selectedOptions = options.entries
                //     .where((entry) => entry.value)
                //     .map((entry) => entry.key)
                //     .toList();
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text("Selected: ${selectedOptions.join(", ")}"),
                //   ),
                // );
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
