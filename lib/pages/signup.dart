import 'package:electromart/pages/bottomnav.dart';
import 'package:electromart/pages/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscuretext = true;
  final _name = TextEditingController();

  final _email = TextEditingController();
  final _Password = TextEditingController();

  String? _validemail(value) {
    if (value!.isEmpty) {
      return "Please enter an EMAIL";
    }
    RegExp emailregularexp =
        RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    if (!emailregularexp.hasMatch(value)) {
      return "Please enter valid email";
    }
    return null;
  }

  String? validatePassword(value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return "Password should contain upper,lower,digit and Special character ";
      } else {
        return null;
      }
    }
  }

  final _formkey = GlobalKey<FormState>();
  String name = "", email = "", password = "";
  registration() async {
    if (password != null && _name.text != "" && _email.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: const Color.fromARGB(255, 45, 221, 51),
            content: Text("Registration succesfully",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black))));
        String ID = randomAlphaNumeric(10);
        Map<String, dynamic> Userinfomap = {
          "name": _name.text,
          "email": _email.text,
          "id": ID,
          "image": "images/demoprofile-removebg.png"
        };
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Bottomnav(),
            ));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: const Color.fromARGB(255, 255, 17, 0),
              content: Text(
                "The password provided is too weak.",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: const Color.fromARGB(255, 255, 17, 0),
              content: Text("The account already exists for that email.",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.only(bottomLeft: Radius.elliptical(800, 500)),
            color: Colors.black,
          ),
          height: MediaQuery.of(context).size.height / 1.2,
          width: double.infinity,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Welcome Back!!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Sign up to continue...",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Image.asset(
                        color: Colors.white,
                        "images/logo1-removebg-preview.png",
                        width: 250,
                        height: 100,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: "Name",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _email,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(30)),
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: "Email",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            hintText: "Eg: exmpl@gmail.com"),
                        style: TextStyle(color: Colors.white),
                        validator: _validemail),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validatePassword,
                      obscureText: _obscuretext,
                      controller: _Password,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscuretext = !_obscuretext;
                            });
                          },
                          child: Icon(
                            color: Colors.white,
                            _obscuretext
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            name = _name.text;
                            email = _email.text;
                            password = _Password.text;
                          });
                        }

                        registration();
                      },
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          width: MediaQuery.of(context).size.width / 2,
                          padding: EdgeInsets.all(7),
                          child: Center(
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Loginpage(),
                                ));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
