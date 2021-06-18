import 'package:case_devindo/blocs/kategory/kategory_bloc.dart';
import 'package:case_devindo/blocs/kategory/kategory_event.dart';
import 'package:case_devindo/blocs/kategory/kategory_state.dart';
import 'package:case_devindo/models/kategory.dart';
import 'package:case_devindo/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KategoryTab extends StatefulWidget {
  const KategoryTab({Key? key}) : super(key: key);

  @override
  _KategoryTabState createState() => _KategoryTabState();
}

class _KategoryTabState extends State<KategoryTab> {
  List<Kategory> _listKategori = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: TextFormField(
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              _searchData(value);
            },
            cursorColor: Colors.grey,
            decoration: new InputDecoration(
                fillColor: Colors.blue,
                filled: true,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.white38)),
          ),
        ),
        Expanded(child: _buildItem(_listKategori))
      ],
    );
  }

  Widget _buildItem(List<Kategory> listKategori) {
    if (listKategori.isEmpty) {
      return Center(
          child: Text(
        'Data Tidak Ditemukan',
        style: TextStyle(color: Colors.grey),
      ));
    } else {
      return ListView.builder(
          itemCount: listKategori.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryItem(
              kategory: listKategori[index],
              index: index,
            );
          });
    }
  }

  Future<void> _searchData(String value) async {
    if (value.isEmpty) {
      _loadData();
    } else {
      String data = await rootBundle.loadString('assets/category.json');
      List<Kategory> listKategori = kategoryFromJson(data);
      List<Kategory> searchKategori = [];
      setState(() {
        searchKategori = listKategori
            .where((x) => x.title.toLowerCase().contains(value.toLowerCase()))
            .toList();
        if (searchKategori.isEmpty) {
          for (var i = 0; i < listKategori.length; i++) {
            for (var j = 0; j < listKategori[i].content.length; j++) {
              Content content = listKategori[i].content[j];
              if (content.title.toLowerCase() == value.toLowerCase() ||
                  content.subtitle.toLowerCase() == value.toLowerCase() ||
                  content.code.toLowerCase() == value.toLowerCase()) {
                searchKategori.add(listKategori[i]);
              }
            }
          }
        }
        _listKategori = searchKategori;
      });
    }
  }

  Future<void> _loadData() async {
    String data = await rootBundle.loadString('assets/category.json');
    setState(() {
      _listKategori = kategoryFromJson(data);
    });
  }
}
