import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final String title;

  const ListViewItem({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Text(title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

class TopMenu extends StatelessWidget {
  const TopMenu({super.key});
  static const menuList = ['美食', '食品', '日用', '花植', '保健', '美食', '食品'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: menuList.length,
            itemBuilder: (context, index) {
              final title = menuList[index];
              return ListViewItem(title: title);
            }));
  }
}
