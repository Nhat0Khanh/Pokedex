import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Thông tin cá nhân")),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60, 
              backgroundImage: AssetImage('assets/images/avatar.jpeg'), 
              backgroundColor: Colors.grey, 
            ),
            SizedBox(height: 20),
            Text("Họ tên: Đặng Nguyễn Nhật Khánh", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Email: 23T1020267@husc.edu.vn"),
            Text("Giới tính: Nam"),
          ],
        ),
      ),
    );
  }
}