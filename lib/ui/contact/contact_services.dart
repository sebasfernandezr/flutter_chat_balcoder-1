import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_balcoder/ui/contact/model/contact_model.dart';

class ContactService {

  final contactCollection = FirebaseFirestore.instance.collection('contactCollection');

  addContact(ContactModel contactModel){
    contactCollection.add(contactModel.toJson()).then((value) {
      print("Guarde contacto");
    });
  }

  deleteContact(ContactModel contactModel){
    contactModel.isDeleted = true;
<<<<<<< HEAD
     contactCollection
     .doc(contactModel.key)
     .update(contactModel.toJson())
     .then((value) {
      print("Guarde contacto");
     });
    

  }

  updateContact(ContactModel contactModel){
     contactCollection
     .doc(contactModel.key)
     .update(contactModel.toJson())
     .then((value) {
      print("Guarde contacto");
     });
=======
    contactCollection.doc(contactModel.key).update(contactModel.toJson()).then((value){});
  }

  updateContact(ContactModel contactModel){
    contactCollection.doc(contactModel.key).update(contactModel.toJson()).then((value){});
>>>>>>> e66c1cfa11c74c406c7625e43083c60408ccc66c
  }


}