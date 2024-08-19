import 'package:electromart/utils/txtstyl.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 1.3,
        margin: EdgeInsets.only(bottom: 70),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.only(bottomLeft: Radius.elliptical(800, 800)),
          color: Colors.white,
        ),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo1-removebg-preview.png",
              width: 300,
            ),
            SizedBox(height: 20),
            Text(
              "ADMIN PANEL",
              style: Txtstyl.boldtextstyle(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.3,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "UserName",
                    prefixIcon: Icon(Icons.person_2_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.3,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "UserName",
                    prefixIcon: Icon(Icons.person_2_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        )),
      ),
    );
  }
}
