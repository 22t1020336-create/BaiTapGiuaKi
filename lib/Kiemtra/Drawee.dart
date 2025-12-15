import 'package:thaydungbt/Kiemtra/Bai1.dart';
import 'package:thaydungbt/Kiemtra/Bai10.dart';
import 'package:thaydungbt/Kiemtra/Bai11.dart';
import 'package:thaydungbt/Kiemtra/Bai2.dart';
import 'package:thaydungbt/Kiemtra/Bai3.dart';
import 'package:thaydungbt/Kiemtra/Bai4.dart';
import 'package:thaydungbt/Kiemtra/Bai5.dart';
import 'package:thaydungbt/Kiemtra/Bai6.dart';
import 'package:thaydungbt/Kiemtra/Bai7.dart';
import 'package:thaydungbt/Kiemtra/Bai8.dart';
import 'package:thaydungbt/Kiemtra/Bai9.dart';
import 'package:flutter/material.dart';
import 'package:thaydungbt/Kiemtra/my_login1.dart';
import 'package:thaydungbt/Kiemtra/news_list.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              "MENU BÀI TẬP",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),

          _menuItem(context, "Bài tập 1: Hello Flutter", MyHome()),
          _menuItem(context, "Bài tập 2: Bố cục", HomePage()),
          _menuItem(context, "Bài tập 3: BuiltLayout", MyLayout()),
          _menuItem(context, "Bài tập 4: Classroom", MyClass()),
          _menuItem(context, "Bài tập 5: Resort", My_Resort()),
          _menuItem(context, "Bài tập 6: Đổi màu", ChangeColorApp()),
          _menuItem(context, "Bài tập 7: Tăng giảm", CounterApp()),
          _menuItem(context, "Bài tập 8: Đếm thời gian", CountdownApp()),
          _menuItem(context, "Bài tập 9: Đăng ký", FormRegister()),
          _menuItem(context, "Bài tập 10: Đăng nhập", FormLogin()),
          _menuItem(context, "Bài tập 11: API Shop", MyProduct()),
          _menuItem(context, "Bài tập 12: API News", NewsListScreen()),
          _menuItem(context, "Bài tập 13: API NguoiDung", MyLogin()),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.pop(context); // ĐÓNG DRAWER
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
    );
  }
}
