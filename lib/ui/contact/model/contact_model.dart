import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactModel {
  String key;
  String contactName;
  String phoneNumber;
  bool isDeleted;

  ContactModel({this.contactName, this.phoneNumber, this.key, this.isDeleted});

  toJson() {
    return {
      "key": key,
      "contactName": contactName,
      "phoneNumber": phoneNumber,
      "isDeleted": isDeleted
    };
  }

  factory ContactModel.fromSnapshot(DocumentSnapshot snapshot) {
    return ContactModel(
        key: snapshot.id,
        contactName: snapshot.data()['contactName'],
        phoneNumber: snapshot.data()['phoneNumber'],
        isDeleted:snapshot.data()['isDeletd']);
        
  }
}
