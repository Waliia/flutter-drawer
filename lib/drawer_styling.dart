import 'package:flutter/material.dart';
import 'package:flutter_drawer/userpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DrawerWidget(),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  final padding = const EdgeInsets.symmetric(horizontal: 20);
  final name = 'Ana Billish';
  final email = 'anabilli@gmail.com';
  final urlImage =
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
      ),
      drawer: Drawer(
        child: Container(
          //   color: Colors.black,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.red,
            Colors.yellow,
            Color(0xFFfe4a97),
            Color(0xFFe17763),
            Color(0xFF68998c)
          ], stops: [
            0.1,
            0.4,
            0.6,
            0.8,
            1
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: ListView(
            //  padding: padding,
            children: [
              buildHeader(
                  urlImage: urlImage,
                  name: name,
                  email: email,
                  onClickable: () =>
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            UserPage(name: 'Anna Billish', urlImage: urlImage),
                      ))),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: padding,
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    // buildSearchField(),
                    // const SizedBox(height: 24),
                    // buildMenuItem(
                    //   text: 'People',
                    //   icon: Icons.people,
                    //   onClicked: () => selectedItem(context, 0),
                    // ),
                    buildMenuItem(
                      text: 'Home',
                      icon: Icons.home,
                      textColor: Colors.purple,
                      iconColor: Colors.purple,
                      onClicked: () => selectedItem(context, 0),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Favourites',
                      icon: Icons.favorite,
                      textColor: Colors.red,
                      iconColor: Colors.red,
                      onClicked: () => selectedItem(context, 1),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'People',
                      icon: Icons.people,
                      textColor: Colors.yellow,
                      iconColor: Colors.yellow,
                      onClicked: () => selectedItem(context, 2),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Workflow',
                      iconColor: Colors.indigo,
                      icon: Icons.workspaces,
                      textColor: Colors.indigo,
                      onClicked: () => selectedItem(context, 3),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Updates',
                      iconColor: Colors.green,
                      icon: Icons.update,
                      textColor: Colors.green,
                      onClicked: () => selectedItem(context, 4),
                    ),
                    const SizedBox(height: 24),
                    Divider(color: Colors.white70),
                    const SizedBox(height: 24),
                    buildMenuItem(
                      text: 'Plugins',
                      iconColor: Colors.white,
                      icon: Icons.account_tree,
                      textColor: Colors.white,
                      // onClicked: () => selectedItem(context, 4),
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'Notifications',
                      textColor: Colors.blue,
                      iconColor: Colors.blue,
                      icon: Icons.notifications,
                      //   onClicked: () => selectedItem(context, 5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text,
      required IconData icon,
      VoidCallback? onClicked,
      Color? iconColor,
      Color? textColor}) {
    const color = Colors.white;
    const hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor,
      ),
      title: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Widget buildHeader(
          {required String name,
          required String email,
          required String urlImage,
          required VoidCallback onClickable,
          hoverColor = Colors.white70}) =>
      InkWell(
        onTap: onClickable,
        hoverColor: hoverColor,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(urlImage),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.pink,
                child: Icon(
                  Icons.outbond_outlined,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      );
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const MyHomePage(),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const MyFavouritePage(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const MyPeoplePage(),
      ));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const MyWorkspacePage(),
      ));
      break;
    case 4:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const MyUpdatePage(),
      ));
      break;
    default:
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
      ),
    );
  }
}

class MyFavouritePage extends StatelessWidget {
  const MyFavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Favourite Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
      ),
    );
  }
}

class MyPeoplePage extends StatelessWidget {
  const MyPeoplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'People Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
      ),
    );
  }
}

class MyWorkspacePage extends StatelessWidget {
  const MyWorkspacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Workspace Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
      ),
    );
  }
}

class MyUpdatePage extends StatelessWidget {
  const MyUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Update Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
      ),
    );
  }
}
