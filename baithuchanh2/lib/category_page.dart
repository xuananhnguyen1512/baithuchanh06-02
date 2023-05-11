import 'package:flutter/material.dart';

import 'details_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Categories'),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 20),
          Icon(Icons.heart_broken_rounded),
          SizedBox(width: 20),
          Icon(Icons.shopping_cart),
          SizedBox(width: 20),
        ],
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        shrinkWrap: true,
        children: [
          _categoryItem('assets/images/fashion.png', 'Fashion', Colors.teal),
          _categoryItem('assets/images/beauty.png', 'Beauty', const Color(0xfffda88b)),
          _categoryItem('assets/images/electronic.png', 'Electronics', const Color(0xff9bbef4)),
          _categoryItem('assets/images/jewelry.png', 'Jewellery', const Color(0xfff69fd6)),
          _categoryItem('assets/images/footwear.png', 'Footwear', const Color(0xffbca1f2)),
          _categoryItem('assets/images/toys.png', 'Toys', const Color(0xff8ec6d3)),
          _categoryItem('assets/images/furniture.png', 'Furniture', const Color(0xffa0d69a)),
          _categoryItem('assets/images/mobile.png', 'Mobiles', const Color(0xfff4e169)),
        ],
      ),
    );
  }

  _categoryItem(String image, String title, Color color) {
    return ElevatedButton(
      onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DetailsPage())),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, bottom: 20),
            alignment: Alignment.centerLeft,
            child: Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(image, width: 50, height: 50),
            ),
          ),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
