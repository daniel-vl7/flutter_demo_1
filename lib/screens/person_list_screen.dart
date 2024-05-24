import 'package:flutter/material.dart';
import 'package:flutter_demo_1/screens/add_person_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class PersonListScreen extends StatefulWidget{
  const PersonListScreen({super.key});

  @override
  State<PersonListScreen> createState() => _PersonListScreenState();
}

class _PersonListScreenState extends State<PersonListScreen>{
  List people = ["John Doe", "Jane Doe", "John Smith", "Jane Smith", "John Johnson", "Jane Johnson","Jorge Mayta"];

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: const Text("List of People"),
    ),
    body: SlidableAutoCloseBehavior(
      closeWhenOpened: true,
      child: ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) {
        return Slidable(
          key: Key(people[index]),
          endActionPane: ActionPane(
            motion: const BehindMotion(),
            dismissible: DismissiblePane(
              onDismissed: () => _onDismissed(index),
            ),
            children: [
              SlidableAction(
                backgroundColor: Colors.red,
                icon: Icons.delete,
                label: 'Delete',
                onPressed: (context) => _onDismissed(index),
              )
            ],
          ),
          child: ListTile(
            leading: const Icon(Icons.person),
            title: Text(people[index]),
          ),
        );
        // return ListTile(
        //   leading: const Icon(Icons.person_2_outlined),
        //   title: Text(people[index]),
      
        // );
      },
    ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddPersonScreen(
              updateList: (name) {
                people.add(name);
                setState(() {
                  people = people;
                });
              },
            ),
          ),
        );
      },
      child: const Icon(Icons.add),
    ),
  );
  }

 void _onDismissed(int index){
  setState(() {
    people.removeAt(index);
  });
 }

}