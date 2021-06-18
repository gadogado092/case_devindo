import 'package:case_devindo/models/user.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final User user;
  final GestureTapCallback? onTap;
  const UserItem({Key? key, required this.user, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          margin: EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                
                Text(user.title.toString(), style: TextStyle(color: Colors.blueAccent, fontSize: 18),),
                SizedBox(height: 4,),
                Text(user.body.toString()),
              ],
            ),
          )),
    );
  }
}
