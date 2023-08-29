// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo ListView"),
      ),
      body: Center(
        child: Column(
          children: [
            ListView(
        children: [
          ListTile(
            title: Text('Item 1'),
            subtitle: Text('Item 1'),
            leading: Icon(Icons.person),
            trailing: Text("X"),
          ),
          ListTile(
            title: Text('Item 2'),
            subtitle: Text("Item 2"),
            leading: Icon(Icons.access_alarm),
            trailing: Text("Y"),
          ),
          ListTile(
            title: Text('Item 3'),
            subtitle: Text("Item 3"),
            leading: Icon(Icons.shopping_basket_outlined),
            trailing: Text("Z"),
          ),
        ],
      ),
          ],
        ),
      )
    );
  }
}
