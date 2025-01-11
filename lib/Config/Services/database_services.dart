import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  Future<bool> addUser(
      String name, String lastname, int age, String email) async {
    // Add user to database
    try {
      await userCollection.add({
        'name': name,
        'lastname': lastname,
        'age': age,
        'email': email,
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
