import 'package:flutter/material.dart';
import 'package:guardianx/home_screen.dart';
import 'signUP_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  bool _isRememberMeChecked = false;

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
                "Hi, Welcome Back! 👋",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  hintText: "example@gmail.com",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _isRememberMeChecked,
                        onChanged: (value) {
                          setState(() {
                            _isRememberMeChecked = value ?? false;
                          });
                        },
                      ),
                      const Text(
                        "Remember Me",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Forgot Password screen
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  ); // Handle Login action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFF9E6),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size(double.infinity, 50), // Full width
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.black26),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Or With",
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Colors.black26),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Google Login Button with Google Logo
              ElevatedButton.icon(
                onPressed: () {
                  // Handle Google Login action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size(double.infinity, 50), // Full width
                  side: const BorderSide(color: Colors.black12),
                ),
                icon: Image.asset(
                  'assets/images/google_logo.png', // Your Google logo path
                  width: 24,
                  height: 24,
                ),
                label: const Text("Login with Google"),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()),
                  ); // Navigate to Sign-Up screen
                },
                child: const Text.rich(
                  TextSpan(
                    text: "Don’t have an account? ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
