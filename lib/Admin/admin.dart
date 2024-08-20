import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electromart/Admin/Home_Admin.dart';
import 'package:electromart/utils/txtstyl.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  TextEditingController _usernamecontroller = new TextEditingController();
  TextEditingController _Passwordcontroller = new TextEditingController();

  bool _obscuretext = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/logo1-removebg-preview.png",
                width: 320,
              ),
              SizedBox(height: 30),
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: _usernamecontroller,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: _Passwordcontroller,
                  obscureText: _obscuretext,
                  decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscuretext = !_obscuretext;
                          });
                        },
                        child: Icon(
                          color: Colors.black,
                          _obscuretext
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      prefixIcon: Icon(Icons.lock_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Login();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
                  width: MediaQuery.of(context).size.width / 2,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }

  Login() {
    FirebaseFirestore.instance.collection("Admin").get().then(
      (snapshot) {
        snapshot.docs.forEach(
          (result) {
            if (result.data()['Username'] != _usernamecontroller.text.trim()) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: const Color.fromARGB(255, 255, 17, 0),
                  content: Text(
                    "Your Username is not Correct",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )));
            } else if (result.data()['Password'] !=
                _Passwordcontroller.text.trim()) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: const Color.fromARGB(255, 255, 17, 0),
                  content: Text(
                    "Your Password is not Correct",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )));
            } else {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeAdmin(),
                  ));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: const Color.fromARGB(255, 5, 218, 62),
                  content: Text(
                    "Admin Login Sucessful.",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )));
            }
          },
        );
      },
    );
  }
}
