import 'package:flutter/material.dart';
import 'package:github_repo_search_app/repo.dart';


import 'package:url_launcher/url_launcher.dart';

class GithubItem extends StatelessWidget {
  final Repo repo;

  GithubItem(this.repo);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          onTap: () {
            _launchURL(repo.htmlUrl);
          },
          splashColor: Colors.purple,
          highlightColor: Colors.cyan,
          child: Container(
            color: Colors.teal,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text((repo.name != null) ? repo.name : '-',
                    style: TextStyle(color: Colors.white),),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      repo.description != null
                          ? repo.description
                          : 'No desription',
                      style: TextStyle(color: Colors.white),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text((repo.owner != null) ? repo.owner : '',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white),),),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.red,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4.0),
                                child: Text(
                                  (repo.watchersCount != null)
                                      ? '${repo.watchersCount} '
                                      : '0 ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            (repo.language != null) ? repo.language : '',
                            textAlign: TextAlign.end,
                            style: TextStyle(color: Colors.white),),),
                      ],
                    ),
                  ),
                ]),
          )),
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