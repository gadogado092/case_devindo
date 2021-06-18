import 'package:case_devindo/tab/kategory_tab.dart';
import 'package:case_devindo/tab/user_tab.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'blocs/my_bloc.dart';

void main() async {
  runApp(
    HomePage()
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'User',
                ),
                Tab(
                  text: 'Category',
                ),
              ],
            ),
            title: Text('Welcome To My App'),
          ),
          body: TabBarView(
            children: [
              UserTab(),
              KategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
