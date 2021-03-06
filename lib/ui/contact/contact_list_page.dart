import 'package:flutter/material.dart';
import 'package:flutter_chat_balcoder/ui/contact/model/contact_model.dart';
import 'package:flutter_chat_balcoder/ui/contact/contact_services.dart';


class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  ContactService _contactService = new ContactService(); //usar metodo
  List<ContactModel> _contactList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Agregar a BD
    // _contactService.addContact(new ContactModel(contactName: "Nombre del contacto", phoneNumber: "320"));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white38,
      child: StreamBuilder(
        stream: _contactService.contactCollection.snapshots(),//Hacer que la ref bd nos traiga la info
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(child: new CircularProgressIndicator(),);
             // break;
            default:
            
            //Recorrer informacion de los documentos
            snapshot.data.docs.forEach((doc){
            _contactList.add(new ContactModel.fromSnapshot(doc));
            });

            return ListView.builder(
              itemCount: _contactList.length,
              itemBuilder: (BuildContext context, int index) { 
                return ListTile(
                  title: Text(_contactList[index].contactName),

                );
               },);
          }
         },),
    );
  }
}