import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../table_of_contents.dart';

class InitAppBAr extends StatelessWidget {
  const InitAppBAr({
    Key? key,
    this.foregroundColor,
    required this.title,
  }) : super(key: key);
  final Color? foregroundColor;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
            // context.read<HomeBloc>().add(SearchTextFieldActivatedEvent());
          },
          icon: Icon(
            Icons.menu,
            color: foregroundColor,
          ),
        ),
        // TODO on tap popup message with a full name of a regulation
        Text(title,
            style: TextStyle(
                color: Color(0XFF3B4C61),
                fontWeight: FontWeight.bold,
                fontSize: 16.0)),
        IconButton(
          onPressed: () {
            context
                .read<TableOfContentsBloc>()
                .add(EventTableOfContentsSearchTextFieldActivated());
          },
          icon: Icon(
            Icons.search,
            color: foregroundColor,
          ),
        ),
      ],
    );
  }
}
