import 'package:flutter/material.dart';
import 'package:regulation/table_of_contents/bloc/table_of_contents_bloc.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class TableOfContentsPage extends StatelessWidget {
  const TableOfContentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: Container(
              child: TableOfContentsAppBar(),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE2E4E7)),
              ),
            ),
          )),
      drawer: const NavigationDrawer(),
      body: ListView(
          children: context.select(
        (TableOfContentsBloc bloc) => bloc.chapters
            .map((e) => ChapterCard(name: e.name, num: e.num, chapterID: e.id))
            .toList(),
      )),
    );
  }
}

class ChapterCard extends StatelessWidget {
  const ChapterCard(
      {Key? key,
      required this.name,
      required this.num,
      required this.chapterID})
      : super(key: key);
  final String name, num;
  final int chapterID;

// TODO user customizable font (size and font family)
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/paragraph', arguments: chapterID);
      },
      child: Card(
        color: Color(0XFFFAFAFA),
        margin: EdgeInsets.zero,
        shape: const Border(
          bottom:
              BorderSide(width: 1.0, color: Color.fromRGBO(230, 230, 230, 1)),
        ),
        child: Container(
            alignment: Alignment.centerLeft,
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                      text: num.isEmpty ? '' : '$num. ',
                      style: TextStyle(
                        color: Color(0XFF3B4C61),
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: name,
                          style: TextStyle(
                              color: Color(0XFF3B4C61),
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Verdana'),
                        ),
                      ]),
                ),
              ],
            )),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );
  Widget buildMenuItems(BuildContext context) => Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined, color: Colors.black),
            title: const Text('Домой'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined, color: Colors.black),
            title: const Text('Домой'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined, color: Colors.black),
            title: const Text('Домой'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined, color: Colors.black),
            title: const Text('Домой'),
            onTap: () {},
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [buildHeader(context), buildMenuItems(context)],
      )),
    );
  }
}
