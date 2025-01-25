import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA9DAD6), // Background color
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create an account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Connect with your friends today!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),

              // Username TextField
              _buildTextField('Enter Your Username', false),
              const SizedBox(height: 15),

              // Email TextField
              _buildTextField('Enter Your Email', false),
              const SizedBox(height: 15),

              // Phone Number TextField
              _buildTextField('Enter Your Phone Number', false),
              const SizedBox(height: 15),

              // Password TextField
              _buildTextField('Enter Your Password', true),
              const SizedBox(height: 20),

              // Sign Up Button
              ElevatedButton(
                onPressed: () {
                  // Handle Sign Up action
                  print("Sign-Up Clicked");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFF9E6), // Button color
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size(double.infinity, 50), // Full width
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 15),

              // Divider
              const Divider(thickness: 1, color: Colors.black54),
              const SizedBox(height: 10),

              // Google Sign Up Button with Logo
              ElevatedButton.icon(
                onPressed: () {
                  // Handle Google Sign-Up action
                  print("Google Sign-Up Clicked");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  side: const BorderSide(color: Colors.black12),
                  minimumSize: const Size(double.infinity, 50), // Full width
                ),
                icon: Image.asset(
                  'assets/images/google_logo.png', // Path to your Google logo image
                  width: 28,
                  height: 28,
                ),
                label: const Text(
                  'Signup with Google',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),

              // Login Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to LoginScreen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.blue,
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
    );
  }

  // Helper method to build text fields
  Widget _buildTextField(String hintText, bool obscureText) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black54),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black38),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: obscureText
            ? IconButton(
                onPressed: () {
                  // Handle show/hide password
                },
                icon: const Icon(Icons.visibility_off, color: Colors.black38),
              )
            : null,
      ),
    );
  }
}
