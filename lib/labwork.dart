import 'package:flutter/material.dart';

class LabWork extends StatefulWidget {
  LabWork({super.key});

  @override
  State<LabWork> createState() => _LabWorkState();
}

class _LabWorkState extends State<LabWork> {
  List<String> todoItem = [];
  void addItems() {
    todoItem.add(item.text);
    setState(() {});
  }

  var item = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              //Flexible or Expanded is the same
              Expanded(
                flex: 2,
                child: TextField(
                  controller: item,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'To do item',
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: ElevatedButton.icon(
                      onPressed: addItems,
                      icon: Icon(Icons.add),
                      label: Text('Add'))),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoItem.length,
              itemBuilder: (_, index) => todoItems(index + 1, todoItem[index]),
            ),
          )
        ],
      ),
    );
  }
}

class todoItems extends StatelessWidget {
  todoItems(this.index, this.item, {super.key});

  String item;
  int index;

  void _deleteItem(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Deleted item: $item')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(item),
        leading: CircleAvatar(child: Text('${index}')),
        trailing: IconButton(
            onPressed: () => _deleteItem(context),
            icon: Icon(Icons.delete_forever)),
        iconColor: Colors.red,
      ),
    );
  }
}
