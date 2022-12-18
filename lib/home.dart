import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  var output = "";
  List<dynamic> ist = ['1', '2', '3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text("Todo App")),
      ),
      body: ListView.builder(
          itemCount: ist.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              color: Colors.blue,
              margin: const EdgeInsets.only(top: 5),
              child: ListTile(
                title: Text(
                  "${ist[index]}",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: new Container(
                  width: 80,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: (() {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Update Note"),
                                    content: TextField(
                                      onChanged: (value) {
                                        output = value;
                                      },
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              ist.replaceRange(
                                                  index, index + 1, {output});
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Update")),
                                    ],
                                  );
                                });
                          }),
                          child: const Icon(Icons.edit)),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              ist.removeAt(index);
                            });
                          },
                          child: const Icon(Icons.delete)),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Add Note"),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            ist.add(output);
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("Add")),
                  ],
                );
              });
        },
        child: const Text("Add"),
      ),
    );
  }
}
