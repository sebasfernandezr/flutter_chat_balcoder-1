import 'package:flutter/material.dart';
import 'package:flutter_chat_balcoder/ui/contact/contact_form_page.dart';
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
      color: Color(0xffe9fbfc),
      child: StreamBuilder(
<<<<<<< HEAD
        stream: _contactService.contactCollection.where('isDeleted',isEqualTo: false).snapshots(),//Hacer que la ref bd nos traiga la info
=======
        stream: _contactService.contactCollection.where('isDeleted', isEqualTo: false).snapshots(),//Hacer que la ref bd nos traiga la info
>>>>>>> e66c1cfa11c74c406c7625e43083c60408ccc66c
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(child: new CircularProgressIndicator(),);
             // break;
            default:
<<<<<<< HEAD
            _contactList =[];
            
=======
            _contactList = [];
>>>>>>> e66c1cfa11c74c406c7625e43083c60408ccc66c
            //Recorrer informacion de los documentos
            snapshot.data.docs.forEach((doc){
            _contactList.add(new ContactModel.fromSnapshot(doc));
            });

            return ListView.builder(
              itemCount: _contactList.length,
              itemBuilder: (BuildContext context, int index) { 
                return Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                  child: Card(
                      child: ListTile(
<<<<<<< HEAD
                        leading: CircleAvatar(child: Text(_contactList[index].contactName[0].toLowerCase()),),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_){
                            return ContactFormPage(
                              contactModel: _contactList[index]);
                          }));
                        },
                        title: Text(_contactList[index].contactName),
                        subtitle: Text(_contactList[index].phoneNumber),
                        trailing: GestureDetector(onTap: (){
                          _contactService.deleteContact(_contactList[index]);
                        },child: Icon(Icons.delete),
                        ),                   
=======
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_){
                            return ContactFormPage(
                              contactModel: _contactList[index]
                            );

                          }));
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.amberAccent,
                          child: Text(_contactList[index].contactName[0].toUpperCase(), style: TextStyle(color: Colors.white),),
                        ),
                        title: Text(_contactList[index].contactName),
                        subtitle: Text(_contactList[index].phoneNumber),
                        trailing: GestureDetector(
                          onTap: (){
                            _contactService.deleteContact(_contactList[index]);
                          },
                          child: Icon(Icons.delete)),                   
>>>>>>> e66c1cfa11c74c406c7625e43083c60408ccc66c
                    ),
                  ),
                );
               },);
          }
         },),
    );
  }
}