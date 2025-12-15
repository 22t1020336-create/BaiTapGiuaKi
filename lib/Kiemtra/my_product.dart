import 'package:thaydungbt/Kiemtra/api.dart';
import 'package:thaydungbt/Kiemtra/product.dart';
import 'package:flutter/material.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  late Future<List<Product>> _futureProducts;

  int _selectedIndex = 0;

  final Color primaryColor = const Color(0xFFEE4D2D);

  @override
  void initState() {
    super.initState();
    _futureProducts = test_api.getAllProduct();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),

      appBar: PreferredSize(
  preferredSize: Size.fromHeight(65),
  child: AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Color(0xFF1BA8FF),
    elevation: 0,

    title: Row(
      children: [
              IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        SizedBox(width: 12),

        /// Ô tìm kiếm
        Expanded(
          child: Container(
            height: 38,
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey[600], size: 22),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Bạn tìm gì hôm nay?",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(width: 10),

        /// ICON GIỎ HÀNG TIKI
        Stack(
          children: [
            Icon(Icons.shopping_cart_outlined,
                size: 30, color: Colors.white),

            Positioned(
              right: 0,
              top: -3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "3",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
),



body: Column(
  children: [

    Expanded(
      child: FutureBuilder<List<Product>>(
        future: _futureProducts,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            if (snap.hasData) {
              return _buildProductGrid(snap.data!);
            } else {
              return const Center(child: Text("Lỗi kết nối"));
            }
          } else {
            return Center(
                child: CircularProgressIndicator(color: primaryColor));
          }
        }),
    ),
  ],
),


    );
  }

  Widget _buildProductGrid(List<Product> listProduct) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.68,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: listProduct.length,
      itemBuilder: (context, index) {
        return _buildProductItem(listProduct[index]);
      },
    );
  }

  

 Widget _buildProductItem(Product p) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(p.image, fit: BoxFit.cover),
          ),
        ),

        // Tiki Trading tag
        Padding(
          padding: EdgeInsets.only(left: 8, top: 6),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
              color: Color(0xFF1C1C1C),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              "Tiki Trading",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ),

        // Tên sản phẩm
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            p.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          ),
        ),

        // Rating
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 12),
              SizedBox(width: 3),
              Text("${p.rating.rate}",
                  style: TextStyle(fontSize: 12, color: Colors.black54)),
              SizedBox(width: 5),
              Text("(${p.rating.count})",
                  style: TextStyle(fontSize: 12, color: Colors.black45)),
            ],
          ),
        ),

        SizedBox(height: 4),

        // Giá
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "${p.price}₫",
            style: TextStyle(
              color: Color(0xFF1BA8FF),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        SizedBox(height: 5),
      ],
    ),
  );
}


}
