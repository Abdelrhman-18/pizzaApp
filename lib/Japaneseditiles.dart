import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:untitled12/Ditels.dart';

class JapaneseDetailsScreen extends StatefulWidget {
  final Japanesefood japaneseFood;

  const JapaneseDetailsScreen({super.key, required this.japaneseFood});

  @override
  State<JapaneseDetailsScreen> createState() => _JapaneseDetailsScreenState();
}

class _JapaneseDetailsScreenState extends State<JapaneseDetailsScreen> {
  int count = 0;
  double totalCount = 0;

  void totalPrice() {
    totalCount = (widget.japaneseFood.price!) * count;
  }

  void totalPriceRemove() {
    totalCount = totalCount - widget.japaneseFood.price!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Text(
            widget.japaneseFood.name!,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
          ),
          Text(
            "${widget.japaneseFood.price!} Eg",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.japaneseFood.img!),
                fit: BoxFit.contain,
              )),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (count > 0) {
                      count--;
                      totalPriceRemove();
                    }
                  });
                },
                icon: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFF68989),
                        Color(0xFFFE5150),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                count.toString(),
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    count++;
                    totalPrice();
                  });
                },
                icon: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFF68989),
                        Color(0xFFFE5150),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Text(
            "$totalCount Eg",
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 75, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/star.png"))),
                    ),
                    const Text(
                      "4.9",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/fire.png"))),
                    ),
                    Text(
                      widget.japaneseFood.dec!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/oclock.png"))),
                    ),
                    const Text(
                      "20 - 30 min",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              height: 60,
              width: 300,
              child: GradientElevatedButton(
                onPressed: () {},
                style: GradientElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  elevation: 50.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFF68989),
                      Color(0xFFFE5150),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Text(
                  "ADD TO CART",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
