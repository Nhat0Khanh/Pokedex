import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_service.dart';
import 'package:flutter_application_1/my_product.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  
  bool isLoading = false;
  final LoginService _loginService = LoginService();

  void _handleLogin() async {
    setState(() => isLoading = true); 

    String? token = await _loginService.loginApp(
      _userController.text,
      _passController.text,
    );

    setState(() => isLoading = false);

    if (token != null) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Shopping()),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Sai tài khoản hoặc mật khẩu!")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Đăng nhập")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _userController,
              decoration: const InputDecoration(
                labelText: "Tên đăng nhập (nhập: emilys)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passController,
              obscureText: true, 
              decoration: const InputDecoration(
                labelText: "Mật khẩu (nhập: emilyspass)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            
            isLoading 
              ? const CircularProgressIndicator() 
              : ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text("Đăng nhập", style: TextStyle(fontSize: 18)),
                ),
          ],
        ),
      ),
    );
  }
}