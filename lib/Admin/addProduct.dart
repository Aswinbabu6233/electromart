import 'dart:io';

import 'package:electromart/Services/Database.dart';
import 'package:electromart/utils/txtstyl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  String? value;
  final List<String> Items = [
    "Camera",
    "Computer Accesories",
    "Headphone",
    "Laptop",
    "Mobilephone",
    "Printer",
    "Watch",
    "Speaker",
    "Tablet",
    "Television"
  ];
  TextEditingController productnamecontroller = new TextEditingController();
  TextEditingController productpricecontroller = new TextEditingController();
  TextEditingController productdiscriptioncontroller =
      new TextEditingController();

  final ImagePicker picker = ImagePicker();
  File? selectedimage;
  Future getimage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    selectedimage = File(image!.path);
    setState(() {});
  }

  uploaditem() async {
    if (selectedimage != null &&
        productdiscriptioncontroller.text != '' &&
        productnamecontroller.text != '' &&
        productpricecontroller.text != '') {
      String addid = randomAlphaNumeric(10);
      Reference firebasestorageREf =
          FirebaseStorage.instance.ref().child('BlockImage').child(addid);
      final UploadTask task = firebasestorageREf.putFile(selectedimage!);
      var downloadURl = await (await task).ref.getDownloadURL();

      Map<String, dynamic> addproducts = {
        "ProductName": productnamecontroller.text,
        "ProductPrice": productpricecontroller.text,
        "productDiscription": productdiscriptioncontroller.text,
        "productImage": downloadURl
      };

      await DatabaseMethods().addProduct(addproducts, value!).then(
        (confirm) {
          selectedimage = null;
          value = '';
          productdiscriptioncontroller.text = '';
          productnamecontroller.text = '';
          productpricecontroller.text = '';
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Color.fromARGB(255, 45, 221, 51),
              content: Text("Product has been added sucessfully",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black))));
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          CupertinoIcons.arrowshape_turn_up_left,
          size: 35,
        ),
        title: Center(
          child: Text(
            'Add Product',
            style: Txtstyl.mediumtextstyle(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:
              const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload the Product Image',
                style: Txtstyl.lighttextstyle(),
              ),
              const SizedBox(
                height: 20,
              ),
              selectedimage == null
                  ? GestureDetector(
                      onTap: () {
                        getimage();
                      },
                      child: Center(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            CupertinoIcons.camera,
                            size: 35,
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              selectedimage!,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Product Name',
                style: Txtstyl.lighttextstyle(),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Color.fromARGB(255, 243, 242, 242),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: productnamecontroller,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Product Price',
                style: Txtstyl.lighttextstyle(),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Color.fromARGB(255, 243, 242, 242),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: productpricecontroller,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Product Discription',
                style: Txtstyl.lighttextstyle(),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Color.fromARGB(255, 243, 242, 242),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: productdiscriptioncontroller,
                  maxLines: 6,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Select Category",
                style: Txtstyl.lighttextstyle(),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      items: Items.map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))).toList(),
                      onChanged: (value) {
                        setState(() {
                          this.value = value;
                        });
                      },
                      hint: Text(
                        "Select",
                        style: Txtstyl.lighttextstyle(),
                      ),
                      value: value,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  uploaditem();
                },
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child: Text("ADD PRODUCT",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
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
