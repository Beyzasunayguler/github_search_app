import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(GithubSearchApp());
}

class GithubSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Github Search',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primaryColor: Colors.cyan[600],
        ),
        home: Home());
  }
}



