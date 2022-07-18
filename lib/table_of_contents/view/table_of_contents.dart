import 'package:flutter/material.dart';
import '../../app/app.dart';
import '../../constants.dart';
import '../../widgets/regulation_app_bar.dart';
import '../bloc/table_of_contents_bloc.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class TableOfContentsPage extends StatelessWidget {
  const TableOfContentsPage({Key? key}) : super(key: key);
// TODO check tap on header (name of regulation is now wrong)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(64.0),
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: RegulationAppBar(color: Color(0xFFE2E4E7), child: TableOfContentsAppBar()),
          )),
      drawer: const NavigationDrawer(),
      body: ListView(
          children: context.select(
        (TableOfContentsBloc bloc) => bloc.chapters
            .map((e) => ChapterCard(
                  name: e.name,
                  num: e.num,
                  chapterID: e.id,
                  chapterOrderNum: e.orderNum,
                  totalChapters: bloc.chapters.length,
                ))
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
      required this.chapterOrderNum,
      required this.totalChapters,
      required this.chapterID})
      : super(key: key);
  final String name, num;
  final int chapterID, chapterOrderNum, totalChapters;

// TODO user customizable font (size and font family)
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/paragraph',
            arguments: ChapterArguments(
                chapterOrderNum: chapterOrderNum,
                totalChapters: totalChapters));
      },
      child: Card(
        // color: Constants.bodyColor,
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
                        color: Constants.appBarHeaderColor,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: name,
                          style: TextStyle(
                              color: Constants.appBarHeaderColor,
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
