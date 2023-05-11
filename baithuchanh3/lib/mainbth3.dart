import 'package:flutter/material.dart';
import 'navigation.dart';
import 'checkout.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryPage(),
    ),
  );
}

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
        backgroundColor: Colors.green,
        leading: const Icon(Icons.filter_alt_outlined),
        title: const Text('Keells'),
        centerTitle: true,
        actions: const [
          Icon(Icons.search_rounded),
          SizedBox(width: 10),
          Icon(Icons.notifications_none_rounded),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _title('All Categories', 'View All'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  _categoryChild('assets/images/household.png', 'Household'),
                  _categoryChild('assets/icons/grocery.png', 'Grocery'),
                  _categoryChild('assets/icons/liquor.png', 'Liqour'),
                  _categoryChild('assets/icons/cheese.png', 'Chilled'),
                ],
              ),
            ),
            _title('Nexus Member Deals', 'View All'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  _childTwo(
                      image: 'assets/images/ginger.jpg',
                      title: 'Ginger',
                      price: 690,
                      weight: 1,
                      favorite: true),
                  _childTwo(
                      image: 'assets/images/garlic.png',
                      title: 'Garlic Premium',
                      price: 380,
                    weight: 1,),
                  _childTwo(
                      image: 'assets/images/red-onions.png',
                      title: 'Red Onions',
                      price: 260.00,
                    weight: 1,),
                ],
              ),
            ),
            _title('Keells Deals', 'View All'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  _childTwo(
                      image: 'assets/images/carrot.png',
                      title: 'Carrot',
                      price: 490.00,
                    weight: 1,),
                  _childTwo(
                      image: 'assets/images/mango.png',
                      title: 'Mango - Bud',
                      price: 210.00,
                      weight: 1,
                      favorite: true),
                  _childTwo(
                      image: 'assets/images/grapes.png',
                      title: 'Grapes - Green',
                      price: 1120,
                    weight: 1,),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _navigation(),
    );
  }



  Widget _childTwo(
      {required String image,
        required String title,
        required double price,
        required int weight,
        bool favorite = false}) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const CheckoutPage())),
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.5,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Image.asset(image),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text('${weight}KG',
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
                Positioned(
                    bottom: 8,
                    right: 8,
                    child: Icon(
                        favorite
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        color: favorite ? Colors.green : Colors.black)),
              ],
            ),
            const SizedBox(height: 5),
            Text(title),
            const SizedBox(height: 5),
            Text('Rs.$price',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  BottomNavigationBar _navigation() {
    int currentIndex = 0;
    return BottomNavigationBar(
      onTap: (int index) {},
      currentIndex: currentIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.store_rounded), label: 'Store'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined), label: 'My Cart'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_rounded), label: 'Favorites'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded), label: 'Profile'),
        BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_rounded), label: 'More'),
      ],
    );
  }
  Widget _categoryChild(String icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.5,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Image.asset(icon),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(title, overflow: TextOverflow.ellipsis),
              const Icon(Icons.arrow_forward_ios_rounded,
                  size: 13, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _title(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Text(title,
              style:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const Spacer(),
          Text(subtitle, style: const TextStyle(color: Colors.green)),
          const SizedBox(width: 5),
          const Icon(Icons.arrow_forward_ios_rounded,
              size: 15, color: Colors.grey),
        ],
      ),
    );
  }
}
