import 'package:case_devindo/detail_user_page.dart';
import 'package:case_devindo/models/user.dart';
import 'package:case_devindo/widgets/user_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserTab extends StatefulWidget {
  const UserTab({Key? key}) : super(key: key);

  @override
  _UserTabState createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  late Future<List<User>> _listUser;
  bool _isLoadMore = false;
  int start = 0;

  @override
  void initState() {
    super.initState();
    _listUser = _loadData(start);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
        future: _listUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildItem(snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildItem(List<User> listUser) {
    if (listUser.isEmpty) {
      return Text('Data Kosong');
    } else {
      return Column(
        children: [
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!_isLoadMore &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  _listUser=_loadMore(start + 10);
                  // start loading data
                  setState(() {
                    _isLoadMore = true;
                  });
                }
                return true;
              },
              child: ListView.builder(
                  itemCount: listUser.length,
                  itemBuilder: (BuildContext context, int index) {
                    return UserItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailUserPage(
                                    user: listUser[index],
                                  )),
                        );
                      },
                      user: listUser[index],
                    );
                  }),
            ),
          ),
          Container(
            height: _isLoadMore ? 50.0 : 0,
            color: Colors.transparent,
            child: Center(
              child: new CircularProgressIndicator(),
            ),
          ),
        ],
      );
    }
  }

  Future<List<User>> _loadData(int start) async {
    final response = await http.get(Uri.parse(
        'http://jsonplaceholder.typicode.com/posts?_start=$start&_limit=10'));
    if (response.statusCode == 200) {
      return userFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<User>> _loadMore(int start) async {
    final response = await http.get(Uri.parse(
        'http://jsonplaceholder.typicode.com/posts?_start=$start&_limit=10'));
    if (response.statusCode == 200) {
      setState(() {
        _isLoadMore = false;
      });
      return userFromJson(response.body) ;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
