import 'package:bloc_demo/todo_app/add_to_do.dart';
import 'package:bloc_demo/todo_app/to_do_cudit_cubit.dart';
import 'package:bloc_demo/todo_app/to_do_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoHome extends StatelessWidget {
  const ToDoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black12,
          title: const Text('My Notes',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        body: BlocBuilder<ToDoCubit, List<ToDoModel>>(
          builder: (context, todoList) {
            return ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(todoList[index].title.toString(),
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700)),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/2,
                                child: Text(
                                "${todoList[index].creteAt.day.toString().padLeft(2, '0')}/${todoList[index].creteAt.month.toString().padLeft(2, '0')}/${todoList[index].creteAt.year.toString()}")),
                          ],
                        ),
                        Text(todoList[index].desc),
                      ]));
                });
          },
        ),
        floatingActionButton: FloatingActionButton(
            tooltip: 'Add Notes',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddToDo()));
            },
            child: const Icon(Icons.add)));
  }
}
