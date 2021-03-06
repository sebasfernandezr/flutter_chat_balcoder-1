import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_balcoder/ui/chat/model/chat_model.dart';
import 'package:flutter_chat_balcoder/ui/contact/model/contact_model.dart';

class ChatServices {

  final chatCollection = FirebaseFirestore.instance.collection('chatCollection');

  addChat(ChatModel chatModel){
    chatCollection.add(chatModel.toJson()).then((value) {
      print("Guarde contacto");
    });
  }

  deleteContact(){
    
  }

  updateContact(){
    
  }


}