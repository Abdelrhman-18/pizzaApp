import 'package:flutter/material.dart';

import 'package:untitled12/Ditels.dart';
import 'package:untitled12/Ditials_Screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'Cartpage.dart';
import 'Japaneseditiles.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedindex = 0;
  List Pagelist = [
    Homepage(),
    Cartpage(),
  ];
  List<foodItems> myfood = [
    foodItems(
        "Melting Cheese", "44 calories", "assets/images/Pizza 3.png", 9.47),
    foodItems(
        "Pizza Capricciosa", "54 calories", "assets/images/Pizza 4.png", 12.55),
    foodItems(
        "Melting Cheese", "44 calories", "assets/images/Pizza 3.png", 9.47),
    foodItems(
        "Pizza Capricciosa", "54 calories", "assets/images/Pizza 4.png", 12.55),
    foodItems(
        "Melting Cheese", "44 calories", "assets/images/Pizza 3.png", 9.47),
    foodItems(
        "Pizza Capricciosa", "54 calories", "assets/images/Pizza 4.png", 12.55),
  ];
  List<Japanesefood> JapaneseItems = [
    Japanesefood(
        "Japanese dish", "34 calories", "assets/images/pexels.jpg", 19.47),
    Japanesefood(
        "Special dish", "64 calories", "assets/images/pexels2.jpg", 22.55),
    Japanesefood(
        "Japanese dish", "34 calories", "assets/images/pexels.jpg", 19.47),
    Japanesefood(
        "Special dish", "64 calories", "assets/images/pexels2.jpg", 22.55),
    Japanesefood(
        "Japanese dish", "34 calories", "assets/images/pexels.jpg", 19.47),
    Japanesefood(
        "Special dish", "64 calories", "assets/images/pexels2.jpg", 22.55),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Color(0xFFFE5150),
        tabBackgroundColor: Color(0xFFF68989),
        gap: 4,
        selectedIndex: selectedindex,
        onTabChange: (index) {
          setState(() {
            selectedindex = index;
          });
        },
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: "Cart",
          ),
          GButton(
            icon: Icons.person,
            text: "Person",
          ),
        ],
      ),

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFF68989),
                    Color(0xFFFE5150),
                  ],
                ),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body:Pagelist[selectedindex],
      SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Hi Alex",
                  style: TextStyle(
                    color: Color(0xFFFE5150),
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Find Your Delicious Food",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xff4F4F4F),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    buildFoodCategory(
                        "assets/images/Food Type 1.png", "Italian"),
                    buildFoodCategory(
                        "assets/images/Food Type 1-2.png", "Japanese"),
                  ],
                ),
                const SizedBox(height: 80),
                const Text(
                  "Italian",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff4F4F4F),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: myfood.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DitialsScreen(foodItem: myfood[index]),
                            ),
                          );
                        },
                        child: buildFoodItem(myfood[index]),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Japanese",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff4F4F4F),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: JapaneseItems.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JapaneseDetailsScreen(
                                  japaneseFood: JapaneseItems[index]),
                            ),
                          );
                        },
                        child: buildJapaneseItem(JapaneseItems[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFoodCategory(String imagePath, String name) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:
                DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget buildFoodItem(foodItems item) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        // Adds space between items
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              item.name!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 5),
            Text(
              item.dec!,
              style: const TextStyle(color: Color(0xFFFE5150)),
            ),
            const SizedBox(height: 5),
            Image.asset(
              item.img!,
              width: 180,
            ),
            const SizedBox(height: 5),
            Text(
              "${item.price!} ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildJapaneseItem(Japanesefood item2) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        // Adds space between items
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              item2.name!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 5),
            Text(
              item2.dec!,
              style: const TextStyle(color: Color(0xFFFE5150)),
            ),
            const SizedBox(height: 5),
            Container(
                child: CircleAvatar(
              backgroundImage: AssetImage(
                item2.img!,
              ),
              minRadius: 80,
              maxRadius: 80,
            )),
            const SizedBox(height: 5),
            Text(
              "${item2.price!} ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
