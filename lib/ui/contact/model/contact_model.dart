import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ContactModel{
bool isDeleted;
String contactName;
String phoneNumber;
String key;

ContactModel({this.contactName, this.phoneNumber, this.key, this.isDeleted});

toJson(){
  return {
    "contactName": contactName,
    "phoneNumber": phoneNumber,
    "isDeleted": isDeleted,
  };

}

  factory ContactModel.fromSnapshot(DocumentSnapshot snapshot){

    return ContactModel(
      key: snapshot.id,
      contactName: snapshot.data()['contactName'],
      isDeleted: snapshot.data()['isDeleted'],
      phoneNumber: snapshot.data()['phoneNumber']);
  }
}