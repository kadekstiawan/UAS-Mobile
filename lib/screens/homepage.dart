import 'package:flutter/material.dart';
import 'package:what_todo/database_helper.dart';
import 'package:what_todo/screens/taskpage.dart';
import 'package:what_todo/widgets.dart';

class DataSearch extends SearchDelegate<String> {
  final tasks = [
    "Tugas 1",
    "Tugas 2",
    "Tugas 3",
    "Tugas 4",
    "Tugas 5",
  ];

  final recentTasks = [
    "Tugas 1",
    "Tugas 2",
    "Tugas 3",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentTasks : tasks;

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.work),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF6A0DAD),
            ),
            accountEmail: Text('lalaland@undiksha.ac.id'),
            accountName: Text('Dhanu Dwi Ela'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: Text(
                "E",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed('/home'),
            title: Text('Home'),
            leading: CircleAvatar(
              backgroundColor: Color(0xFF6A0DAD),
              child: Icon(Icons.home, color: Colors.white),
            ),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed('/profil'),
            title: Text('Developer'),
            leading: CircleAvatar(
              backgroundColor: Color(0xFF6A0DAD),
              child: Icon(Icons.person_outline, color: Colors.white),
            ),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed('/theme'),
            title: Text('Theme'),
            leading: CircleAvatar(
              backgroundColor: Color(0xFF6A0DAD),
              child: Icon(Icons.format_paint, color: Colors.white),
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Help'),
            leading: CircleAvatar(
              backgroundColor: Color(0xFF6A0DAD),
              child: Icon(Icons.help, color: Colors.white),
            ),
          ),
          ListTile(
            title: Text('Settings'),
            leading: CircleAvatar(
              backgroundColor: Color(0xFF6A0DAD),
              child: Icon(Icons.settings, color: Colors.white),
            ),
          ),
        ],
      )),
      appBar: AppBar(
        title: Image.asset(
          'assets/images/qwqw.png',
          fit: BoxFit.cover,
          height: 25.0,
        ),
        backgroundColor: Color(0xFF6A0DAD),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          color: Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 32.0,
                      bottom: 32.0,
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      initialData: [],
                      future: _dbHelper.getTasks(),
                      builder: (context, snapshot) {
                        return ScrollConfiguration(
                          behavior: NoGlowBehaviour(),
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Taskpage(
                                        task: snapshot.data[index],
                                      ),
                                    ),
                                  ).then(
                                    (value) {
                                      setState(() {});
                                    },
                                  );
                                },
                                child: TaskCardWidget(
                                  title: snapshot.data[index].title,
                                  desc: snapshot.data[index].description,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Taskpage(
                                task: null,
                              )),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF6881FF), Color(0xFF643FDB)],
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, 1.0)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image(
                      image: AssetImage(
                        "assets/images/add_icon.png",
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
