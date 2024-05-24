import 'package:flutter/material.dart';

class AddPersonScreen extends StatelessWidget{
  AddPersonScreen({super.key, required this.updateList});

  final Function updateList;

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          updateList(_controller.text);
          Navigator.pop(context);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}