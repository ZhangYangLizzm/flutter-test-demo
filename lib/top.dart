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

const menuList = ['美食', '食品', '日用', '花植', '保健', '美食', '食品'];

class TopMenu extends StatelessWidget {
  const TopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: menuList.map((title) => ListViewItem(title: title)).toList(),
    );
  }
}
