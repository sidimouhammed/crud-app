import 'package:crud_contact/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Contact> contacts = List.empty(growable: true);
  TextEditingController NameController = TextEditingController();
  TextEditingController NumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Contacts'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: NameController,
                decoration: const InputDecoration(
                    hintText: 'Full Name',
                    hintStyle: TextStyle(),
                    label: Text('Full Name'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: NumberController,
                keyboardType: TextInputType.number,
                maxLength: 8,
                decoration: const InputDecoration(
                    hintText: 'Your Number',
                    hintStyle: TextStyle(),
                    label: Text('Your Number'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      String name = NameController.text.trim();
                      String number = NumberController.text.trim();
                      if (name.isNotEmpty && number.isNotEmpty) {
                        setState(() {
                          contacts.add(Contact(name: name, number: number));
                        });
                      }
                    },
                    child: const Text('Save')),
                ElevatedButton(onPressed: () {}, child: const Text('Update'))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: contacts.isEmpty
                  ? const Text(
                      'No any contact yet....',
                      style: TextStyle(fontSize: 20),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: contacts.length,
                          itemBuilder: (context, index) => getRow(index)),
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: index % 2 == 0 ? Colors.deepPurple : Colors.purple,
        foregroundColor: Colors.white,
        child: Text(contacts[index].name![0]),
      ),
      title: Column(
        children: [Text(contacts[index].name!), Text(contacts[index].number!)],
      ),
    );
  }
}
