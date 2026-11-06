import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final nameRegex = RegExp(r'^[a-zA-Z ]{3,}$');
  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  final phoneRegex = RegExp(r'^(?:\+8801|01)[3-9]\d{8}$');
  final passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F4F1),
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: const Color.fromARGB(255, 23, 48, 92),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Card(
              elevation: 6,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                            255,
                            13,
                            28,
                            53,
                          ).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person_add_alt_1,
                          size: 55,
                          color: Color.fromARGB(255, 34, 59, 126),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Register to get started",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const SizedBox(height: 25),
                      InputField(
                        controller: nameController,
                        label: "Full Name",
                        prefixIcon: Icons.person,
                        validator: (value) {
                          if (value == null ||
                              !nameRegex.hasMatch(value.trim())) {
                            return "Enter a valid name (at least 3 letters)";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      InputField(
                        controller: emailController,
                        label: "Email",
                        prefixIcon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              !emailRegex.hasMatch(value.trim())) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      InputField(
                        controller: phoneController,
                        label: "Phone Number",
                        prefixIcon: Icons.phone,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null ||
                              !phoneRegex.hasMatch(value.trim())) {
                            return "Enter a valid BD phone number";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      InputField(
                        controller: passwordController,
                        label: "Password",
                        prefixIcon: Icons.lock,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || !passwordRegex.hasMatch(value)) {
                            return "8+ chars, uppercase, lowercase, number & symbol";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        height: 50,

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              49,
                              98,
                              191,
                            ),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Registration validation successful!",
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),

                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },

                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Color.fromARGB(255, 26, 47, 98),
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
            ),
          ),
        ),
      ),
    );
  }
}
