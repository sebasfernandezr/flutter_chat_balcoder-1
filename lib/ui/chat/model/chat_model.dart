import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ChatModel{
String key;
String message;
String sendToUID;
String uid;
Timestamp createdDate;

ChatModel({this.key, 
this.message,
this.sendToUID,
this.uid,
this.createdDate
});

toJson(){
  return {
    "key": key,
    "message": message,
    "sentToUID": sendToUID,
    "uid": uid,
    "createdDate": createdDate,

  };

}

  factory ChatModel.fromSnapshot(DocumentSnapshot snapshot){

    return ChatModel(
      key: snapshot.id,
      message: snapshot.data()['message'],
      sendToUID: snapshot.data()['sentToUID'],
      uid: snapshot.data()['uid'],
      createdDate: snapshot.data()['createdData'],
      
      );
  }
}