import 'package:flutter/material.dart';
import 'package:github/api.dart';
import 'package:github/user.dart';
import 'package:github/item.dart';
import 'package:github/search.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User> _users = List();
  bool _isFetching = false;
  String _error;

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  void loadUsers() async {
    setState(() {
      _isFetching = true;
      _error = null;
    });

    final users = await Api.getUsers();
    setState(() {
      _isFetching = false;
      if (users != null) {
        this._users = users;
      } else {
        _error = 'Error fetching users';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(top: 4.0),
          child: Column(
            children: <Widget>[
              Text('Github Users',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .apply(color: Colors.white)),
            ],
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchList(),
                    ));
              }),
        ],
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    if (_isFetching) {
      return Container(alignment: Alignment.center);
    } else if (_error != null) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          _error,
          style: Theme.of(context).textTheme.headline4,
        ),
      );
    } else {
      return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          itemCount: _users.length,
          itemBuilder: (BuildContext context, int index) {
            return GithubItem(_users[index]);
          });
    }
  }
}
