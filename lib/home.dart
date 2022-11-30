import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  var output = "";
  List<dynamic> lst = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO APP")),
      body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                
                Color.fromARGB(255, 18, 103, 173),
                Colors.blue,
              ])),
              // color: Color.fromARGB(255, 29, 120, 194),
              margin: EdgeInsets.only(top: 15),
              child: ListTile(
                title: Text("${lst[index]}"),
                trailing: Container(
                  width: 50,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("EDIT item"),
                                    content: TextField(onChanged: (value) {
                                      output = value;
                                    }),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            setState(() {
                                              lst.replaceRange(
                                                  index, index + 1, {output});
                                            });
                                          },
                                          child: Text("EDIT"))
                                    ],
                                  );
                                });
                          },
                          child: Icon(Icons.edit)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              lst.removeAt(index);
                            });
                          },
                          child: Icon(Icons.delete)),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop;
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add item"),
                  content: TextField(onChanged: (value) {
                    output = value;
                  }),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            lst.add(output);
                          });
                        },
                        child: Text("ADD"))
                  ],
                );
              });
        },
        child: Text("add"),
      ),
    );
  }
}
