import 'package:flutter/material.dart';

void main() {
  //sddksjdk
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(360)),
        backgroundColor: Colors.pink,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                'Drawer Header',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              decoration: BoxDecoration(color: Colors.pink.shade300),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(
                Icons.message,
                color: Colors.green,
              ),
              title: Text('Inbox'),
            ),
            ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.red.shade600,
              ),
              title: Text('Favourite'),
            ),
            ListTile(
              leading: Icon(Icons.music_note_outlined, color: Colors.purple),
              title: Text('Music'),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.brown,
              ),
              title: Text('Setting'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
