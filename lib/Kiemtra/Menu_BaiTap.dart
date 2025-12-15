import 'package:flutter/material.dart';
import 'package:thaydungbt/Kiemtra/Drawee.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang chính"),
      ),
      drawer: AppDrawer(), // GẮN DRAWER
      body: Center(
        child: Text(
          "Bùi Ngọc Uyên Phương",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

