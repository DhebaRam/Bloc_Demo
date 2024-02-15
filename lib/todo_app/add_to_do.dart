import 'package:bloc_demo/todo_app/to_do_cudit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToDo extends StatelessWidget {
  const AddToDo({super.key});

  @override
  Widget build(BuildContext context) {
    final toDoCubit = ToDoCubit();
    final TextEditingController titleController = TextEditingController(), descController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black12,
          title: const Text('Add Notes', textAlign: TextAlign.center),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: titleController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
                hintText: 'Title',
                hintStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: descController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
                hintText: 'Description',
                hintStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              context.read<ToDoCubit>().addToDo(titleController.text, descController.text);
              Navigator.of(context).pop();
              titleController.clear();
              descController.clear();
            },
            color: Colors.black,
            height: 45,
            minWidth: MediaQuery.of(context).size.width / 1.1,
            child: const Text('ADD',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          )
        ]));
  }
}
