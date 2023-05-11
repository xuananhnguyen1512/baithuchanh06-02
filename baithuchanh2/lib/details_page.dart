import 'package:flutter/material.dart';
import '';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String action = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0,
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
      body: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _categoryItem('assets/images/fashion.png', 'Fashion'),
                _categoryItem('assets/images/beauty.png', 'Beauty'),
                _categoryItem('assets/images/electronic.png', 'Electronics'),
                _categoryItem('assets/images/jewelry.png', 'Jewellery'),
                _categoryItem('assets/images/footwear.png', 'Footwear'),
                _categoryItem('assets/images/toys.png', 'Toys'),
                _categoryItem('assets/images/furniture.png', 'Furniture'),
                _categoryItem('assets/images/mobile.png', 'Mobiles'),
              ],
            ),
          ),
          const SizedBox(width: 5),
          SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 125,
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  _productChild('assets/images/laptop.png', 'Laptop / PC', 89),
                  _productChild('assets/images/television.png', 'Televisions', 105),
                  _productChild('assets/images/dryer.png', 'Dryers/Styling', 65),
                  _productChild('assets/images/headphone.png', 'Headphones', 77),
                  _productChild('assets/images/tablet.png', 'Tablet', 28),
                  _productChild('assets/images/mobile-covers.png', 'Mobile Covers', 68),
                  _productChild('assets/images/printers.png', 'Printers', 44),
                  _productChild('assets/images/healthcare.png', 'Healthcare', 89),
                  _productChild('assets/images/powerbank.png', 'Powerbank', 71),
                  _productChild('assets/images/smartwatch.png', 'Smartwatches', 34),
                  _productChild('assets/images/laundry.png', 'Laundry', 175),
                  _productChild('assets/images/blender.png', 'Blenders', 26),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _productChild(String image, String title, int value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: (MediaQuery.of(context).size.width - 125) / 2,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(image, width: (MediaQuery.of(context).size.width - 125) / 2 - 10, height: 90),
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: value > 99 ? 1.5 : 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text('$value'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  _categoryItem(String image, String title) {
    return InkWell(
      onTap: () {
        setState(() {
          action = title;
        });
      },
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: action != title ? Colors.white : Colors.grey.shade200,
          border: Border(
            left: action != title ? BorderSide.none : const BorderSide(color: Colors.pink, width: 3),
            bottom: BorderSide(color: Colors.grey.shade300, width: 1.5),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              child: Container(
                width: 55,
                height: 55,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset(image, width: 25, height: 25, color: action == title ? null : Colors.grey),
              ),
            ),
            Text(title, style: TextStyle(color: action != title ? Colors.grey : Colors.pink, fontSize: 15, fontWeight: FontWeight.w500)),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

}
