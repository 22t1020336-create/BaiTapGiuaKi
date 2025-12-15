import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MyAppBar(), body: myBody());
  }

  PreferredSizeWidget MyAppBar() {
    return AppBar(
      title: const Text("Trang chủ"),
      backgroundColor: Colors.blue,
      actions: [
        IconButton(icon: const Icon(Icons.home_filled), onPressed: () {}),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
          },
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            // xử lý menu
          },
        ),
      ],
    );
  }

  Widget myBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Xin chào', style: TextStyle(color: Colors.red, fontSize: 40)),
        Icon(Icons.heart_broken, color: Colors.red, size: 150),
        Text(
          "Tôi tên là Bùi Ngọc Uyên Phương",
          style: TextStyle(color: Colors.blueAccent, fontSize: 30),
        ),
      ],
    );
  }
}
