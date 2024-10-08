import 'package:electromart/utils/txtstyl.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> Allproducts = [
    {
      "price": "₹28,990",
      "name":
          "Acer Aspire 3 intel core i3 12th Gen 1215U-(8 GB/512 GB SSD/Windows 11 Home)",
      "image": "images/Acer Aspire3.png"
    },
    {
      "price": "₹36,990",
      "name":
          "HP 14s (2024) Intel Core i3 11th Gen 1115G4 - (8 GB/512 GB SSD/Windows 11 Home)",
      "image": "images/HP 14s(2024).png"
    },
    {
      "price": "₹28,990",
      "name":
          "Acer Aspire 3 intel core i3 12th Gen 1215U-(8 GB/512 GB SSD/Windows 11 Home)",
      "image": "images/Acer Aspire3.png"
    },
    {
      "price": "₹36,990",
      "name":
          "HP 14s (2024) Intel Core i3 11th Gen 1115G4 - (8 GB/512 GB SSD/Windows 11 Home)",
      "image": "images/HP 14s(2024).png"
    },
    {
      "price": "₹28,990",
      "name":
          "Acer Aspire 3 intel core i3 12th Gen 1215U-(8 GB/512 GB SSD/Windows 11 Home)",
      "image": "images/Acer Aspire3.png"
    },
    {
      "price": "₹36,990",
      "name":
          "HP 14s (2024) Intel Core i3 11th Gen 1115G4 - (8 GB/512 GB SSD/Windows 11 Home)",
      "image": "images/HP 14s(2024).png"
    },
    {
      "price": "₹28,990",
      "name":
          "Acer Aspire 3 intel core i3 12th Gen 1215U-(8 GB/512 GB SSD/Windows 11 Home)",
      "image": "images/Acer Aspire3.png"
    },
    {
      "price": "₹36,990",
      "name":
          "HP 14s (2024) Intel Core i3 11th Gen 1115G4 - (8 GB/512 GB SSD/Windows 11 Home)",
      "image": "images/HP 14s(2024).png"
    },
    {
      "price": "₹28,990",
      "name":
          "Acer Aspire 3 intel core i3 12th Gen 1215U-(8 GB/512 GB SSD/Windows 11 Home)",
      "image": "images/Acer Aspire3.png"
    },
    {
      "price": "₹36,990",
      "name":
          "HP 14s (2024) Intel Core i3 11th Gen 1115G4 - (8 GB/512 GB SSD/Windows 11 Home)",
      "image": "images/HP 14s(2024).png"
    },
    {
      "price": "₹28,990",
      "name":
          "Acer Aspire 3 intel core i3 12th Gen 1215U-(8 GB/512 GB SSD/Windows 11 Home)",
      "image": "images/Acer Aspire3.png"
    },
    {
      "price": "₹36,990",
      "name":
          "HP 14s (2024) Intel Core i3 11th Gen 1115G4 - (8 GB/512 GB SSD/Windows 11 Home)",
      "image": "images/HP 14s(2024).png"
    },
    {
      "price": "₹28,990",
      "name":
          "Acer Aspire 3 intel core i3 12th Gen 1215U-(8 GB/512 GB SSD/Windows 11 Home)",
      "image": "images/Acer Aspire3.png"
    },
    {
      "price": "₹36,990",
      "name":
          "HP 14s (2024) Intel Core i3 11th Gen 1115G4 - (8 GB/512 GB SSD/Windows 11 Home)",
      "image": "images/HP 14s(2024).png"
    },
  ];

  final List<Map<String, dynamic>> categories = [
    {"image": "images/camera.png", "name": "Camera Devices"},
    {"image": "images/keyboard.png", "name": "Computer Accesories"},
    {"image": "images/headset.png", "name": "Headsets"},
    {"image": "images/laptop.png", "name": "Laptop & Desktop"},
    {"image": "images/mobilephn.png", "name": "Mobiles"},
    {"image": "images/projector.png", "name": "Printer, Projectors & more"},
    {"image": "images/Smartwatch.png", "name": "Watches"},
    {"image": "images/speaker.png", "name": "Speakers & SoundBar"},
    {"image": "images/tablet.png", "name": "Tablets"},
    {"image": "images/tv.png", "name": "Televisions"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 238, 238),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hey, Aswin Babu",
                          style: Txtstyl.boldtextstyle(),
                        ),
                        Text(
                          "Elevate Your Everyday",
                          style: Txtstyl.lighttextstyle(),
                        )
                      ],
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "images/profile4.jpeg",
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search Products",
                        hintStyle: Txtstyl.lighttextstyle(),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Colors.black,
                          size: 35,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Categories",
                  style: Txtstyl.mediumtextstyle(),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(right: 15, top: 4, bottom: 4),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 4,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            // margin: EdgeInsets.only(right: 15),
                            padding: EdgeInsets.only(top: 7, right: 5, left: 5),
                            child: Padding(
                              padding: EdgeInsets.only(right: 5, left: 5),
                              child: Center(
                                child: Image.asset(
                                  categories[index]["image"],
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "All Products.📦",
                  style: Txtstyl.mediumtextstyle(),
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 180),
                  itemCount: Allproducts.length,
                  itemBuilder: (context, index) {
                    return Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  Allproducts[index]["image"],
                                  height: 130,
                                  width: 140,
                                ),
                                Text(
                                  Allproducts[index]["name"],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  Allproducts[index]["price"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
