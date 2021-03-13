import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class UserModel{
String key;
String email;
String uid;


UserModel({this.key, 
this.email,
this.uid,
});

toJson(){
  return {
    "key": key,
    "email": email,
    "uid": uid,

  };

}

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot){

    return UserModel(
      key: snapshot.id,
      email: snapshot.data()['email'],
      uid: snapshot.data()['uid'],
      
      );
  }
}