import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseServices {
  final auth = FirebaseAuth.instance;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');

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

  addNote(
    String note,
  ) {
    notesCollection.add({
      'uidcreador': auth.currentUser!.uid,
      'text': note,
      'date': Timestamp.now()
    });
  }

  notelist() {
    // Esto serviría para mostrar todas las notas del usuario
    return notesCollection
        .where('uidcreador', isEqualTo: auth.currentUser!.uid)
        .orderBy('date', descending: true)
        .snapshots();

    // Esto serviriá para limitar la cantidad de notas que se muestran
    //return notesCollection.limit(10).snapshots();

    // Esto serviría para ordenar las notas por fecha
    //return notesCollection.orderBy('date', descending: true).snapshots();
  }

  deleteNote(
    String id,
  ) {
    // Eliminar nota
    notesCollection.doc(id).delete();
  }

  updateNote(String id, String text) {
    // Actualizar nota
    notesCollection
        .doc(id)
        .set({'text': text, 'date': Timestamp.now()}, SetOptions(merge: true));
  }
}
