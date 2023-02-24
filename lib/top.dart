import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final String title;
  const ListViewItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 24, color: Color.fromARGB(155, 14, 205, 183)),
      ),
    );
  }
}

class TopMenu extends StatelessWidget {
  const TopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const <Widget>[
        ListViewItem(title: '美食'),
        ListViewItem(title: '食品'),
        ListViewItem(title: '日用'),
        ListViewItem(title: '花植'),
        ListViewItem(title: '保健'),
        ListViewItem(title: '美食'),
        ListViewItem(title: '食品'),
      ],
    );
  }
}
