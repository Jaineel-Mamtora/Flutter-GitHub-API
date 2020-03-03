import 'package:flutter/material.dart';
import 'package:github/user.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubItem extends StatelessWidget {
  final User user;
  GithubItem(this.user);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          _launchURL(user.htmlUrl);
        },
        highlightColor: Colors.lightBlueAccent,
        splashColor: Colors.red,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text((user.name != null) ? "Name: " + user.name : '-',
                  style: Theme.of(context).textTheme.subtitle2),
              Text((user.htmlUrl != null) ? "Link: " + user.htmlUrl : '-',
                  style: Theme.of(context).textTheme.subtitle2),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 4.0),
                          ),
                        ],
                      ),
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

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
