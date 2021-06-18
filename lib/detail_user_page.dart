import 'package:flutter/material.dart';

import 'models/user.dart';

class DetailUserPage extends StatelessWidget {
  final User user;
  const DetailUserPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${user.title}"),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(user.body.toString()),
            ],
          ),
        ));
  }
}
