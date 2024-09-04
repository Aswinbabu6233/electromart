import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future adduserDetails(Map<String, dynamic> Userinfo, String id) async {
    return await FirebaseFirestore.instance
        .collection("User")
        .doc(id)
        .set(Userinfo);
  }

  Future addProduct(Map<String, dynamic> Userinfo, String categoryname) async {
    return await FirebaseFirestore.instance
        .collection(categoryname)
        .add(Userinfo);
  }
}
