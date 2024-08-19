import 'package:electromart/utils/txtstyl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Productdetails extends StatefulWidget {
  const Productdetails({super.key});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 238, 238),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        CupertinoIcons.arrowshape_turn_up_left_circle,
                        size: 43,
                        color: Colors.black,
                      ),
                    ),
                    Image.asset(
                      "images/Acer Aspire3.png",
                      height: 400,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(top: 15, right: 10, left: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReadMoreText(
                            "Acer Aspire 3 intel core i3 12th Gen 1215U-(8 GB/512 GB SSD/Windows 11 Home) A324-51 Thin and Light Laptop (14 inch,steel grey, 1.45 Kg) ",
                            trimLines: 3,
                            textAlign: TextAlign.justify,
                            trimMode: TrimMode.Line,
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "₹28,990/-",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 2, 2, 57),
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Details..",
                            style: Txtstyl.mediumtextstyle(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            textAlign: TextAlign.justify,
                            'The Acer Aspire 3 A324-51 is a lightweight and portable laptop with a 14-inch Full HD display. It is powered by a 12th Gen Intel Core i3 processor, paired with 8 GB of RAM and a 512 GB SSD for fast performance. The laptop runs on Windows 11 Home and features integrated Intel UHD Graphics. It weighs 1.45 kg and comes in a sleek steel grey color. It offers up to 8 hours of battery life and includes essential ports like USB, HDMI, and an Ethernet jack. Ideal for everyday tasks and on-the-go use.',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Text(
                                  "Buy Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
