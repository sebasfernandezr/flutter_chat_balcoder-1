import 'package:flutter/material.dart';
import 'package:flutter_chat_balcoder/ui/contact/contact_form_page.dart';
import 'package:flutter_chat_balcoder/ui/contact/model/contact_model.dart';
import 'package:flutter_chat_balcoder/ui/contact/contact_services.dart';

ContactService _contactService = new ContactService();
List<ContactModel> _contactList = [];
int index;

class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  //usar metodo

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
        stream: _contactService.contactCollection
            .where('isDeleted', isEqualTo: false)
            .snapshots(), //Hacer que la ref bd nos traiga la info
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(
                child: new CircularProgressIndicator(),
              );
            // break;
            default:
              _contactList = [];

              //Recorrer informacion de los documentos
              snapshot.data.docs.forEach((doc) {
                _contactList.add(new ContactModel.fromSnapshot(doc));
              });

              return ListView.builder(
                itemCount: _contactList.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 5.0),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(
                              _contactList[index].contactName[0].toUpperCase()),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return ContactFormPage(
                                contactModel: _contactList[index]);
                          }));
                        },
                        title: Text(_contactList[index].contactName),
                        subtitle: Text(_contactList[index].phoneNumber),
                        trailing: GestureDetector(
                          onTap: () {
                            showAlertDialog(BuildContext context) {
                              // set up the button
                              Widget okButton = FlatButton(
                                child: Text("Eliminar"),
                                onPressed: () {
                                  _contactService
                                      .deleteContact(_contactList[index]);
                                  Navigator.of(context).pop();
                                },
                              );

                              Widget cancelButton = FlatButton(
                                child: Text("Cancelar"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              );

                              // set up the AlertDialog
                              AlertDialog alert = AlertDialog(
                                title: Text("¿Esta seguro?"),
                                content: Text(
                                    "esta a punto de eliminar el contacto"),
                                actions: [okButton, cancelButton],
                              );

                              // show the dialog
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert;
                                },
                              );
                            }

                            showAlertDialog(context);
                          },
                          child: Icon(Icons.delete),
                        ),
                      ),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
