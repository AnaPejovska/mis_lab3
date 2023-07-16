import 'package:flutter/material.dart';
import 'Model/list_item.dart';
import 'Widgets/nov_element.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '193052 Lab-3',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'University Organizer Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  List<ListItem> _userItems = [
    ListItem(id: "Course1", course: "Mobile Information System", date: DateTime.now()),
    ListItem(id: "Course2", course: "Management Information System", date: DateTime.now())
  ];


  void _addItemFunction(BuildContext ct){
    showModalBottomSheet(context:ct, builder: (BuildContext context) {
      return GestureDetector(
          onTap: () {},
          child: NovElement(_addNewItemToList),
          behavior: HitTestBehavior.opaque
      );
    });
  }


  void _addNewItemToList(ListItem item){
    setState(() {_userItems.add(item);
    });
  }

  void _deleteItem(String id){
    setState(() {
      _userItems.removeWhere((e) => e.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Exams"),
          actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addItemFunction(context),),
          ]),
      body: Center(
        child: _userItems.isEmpty
            ? Text("No elements")
            : ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: ListTile(
                title: Text(
                  _userItems[index].course,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                subtitle: Text(
                  "Date: " + _userItems[index].date.day.toString()
                      + "." + _userItems[index].date.month.toString()
                      + "." + _userItems[index].date.year.toString()
                      + "   Time: " + _userItems[index].date.hour.toString()
                      + ":" + _userItems[index].date.minute.toString(),
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteItem(_userItems[index].id),
                ),
              ),
            );
          },
          itemCount: _userItems.length,
        ),
      )
    );
  }
}