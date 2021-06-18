import 'package:case_devindo/models/kategory.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Kategory kategory;
  final int index;

  const CategoryItem({Key? key, required this.kategory, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _buildColor(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              kategory.title,
              style: TextStyle(color: Colors.blueAccent, fontSize: 18),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: kategory.content.length,
              itemBuilder: (BuildContext context, int index) {
                return ContentItem(
                  content: kategory.content[index],
                );
              }),
        ],
      ),
    );
  }
}

Color _buildColor(int index) {
  if (index % 2 == 0) {
    return Colors.white10;
  } else {
    return Colors.white;
  }
}

class ContentItem extends StatelessWidget {
  final Content content;

  const ContentItem({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: Container(
        padding: EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              content.title,
              style: TextStyle(color: Colors.blueAccent),
            ),
            Text(content.subtitle),
            Text(content.code),
          ],
        ),
      ),
    );
  }
}
