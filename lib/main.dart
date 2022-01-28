// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'screens/newtask.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        '/newtask': (context) => newtask(),
    },


    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  int navIndex = 0;
  List<String> todoList = <String>[];
  void _incrementCounter() {
    setState(() {

    });
  }


  List<Widget> getItems() {
    final List<Widget> todoWidgets = <Widget>[];
    for (String title in todoList) {
      todoWidgets.add(Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Text(
            title,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ));
    }
    return todoWidgets;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Home page"),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 300,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: DrawerHeader(
                // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                  ),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Icon(
                        Icons.account_circle_rounded,
                        size: 200,
                      ),
                      // ignore: prefer_const_constructors
                      ListTile(
                        // ignore: prefer_const_constructors
                        title: Text(
                          'User Name',
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )),
            ),
            Divider(height: 0.2),
            ListTile(
                title: Text('About'),
                leading: Icon(
                  Icons.settings_applications,
                ))
          ],
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(50),
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: getItems(),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        fixedColor: Colors.blueAccent,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            title: Text('Home'),
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('Search'),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text('profile'),
            icon: Icon(Icons.account_circle),

          )
        ],
        onTap: (int indexOfItem) {
          setState(() {
            navIndex = indexOfItem;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/newtask");
          /*showDialog(
              context: context,
              builder: (context) {
                return Center(
                    child: Card(
                      child: Container(
                        width: 350,
                        height: 200,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                'Add Task',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                style: TextStyle(fontSize: 20),
                                controller: _textFieldController,
                                decoration: InputDecoration(
                                  hintText: 'Enter here',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(15),
                              width: 60,
                              height: 40,
                              child: RaisedButton(
                                color: Colors.red,
                                child: Text('ADD'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  _addTodoItem(_textFieldController.text);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
              });*/
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}