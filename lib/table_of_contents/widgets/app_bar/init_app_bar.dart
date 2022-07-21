import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../table_of_contents.dart';

class InitAppBAr extends StatelessWidget {
  const InitAppBAr({
    Key? key,
    required this.title,
    required this.name,
  }) : super(key: key);

  final String title, name;
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
            size: Theme.of(context).appBarTheme.iconTheme!.size,
            color: Theme.of(context).appBarTheme.iconTheme!.color,
          ),
        ),
        // TODO on tap popup message with a full name of a regulation
        GestureDetector(
          onTap: () {
           ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(name)));
          },
          child: Text(title, style: Theme.of(context).appBarTheme.titleTextStyle),
        ),
        IconButton(
          onPressed: () {
            context
                .read<TableOfContentsBloc>()
                .add(EventTableOfContentsSearchTextFieldActivated());
          },
          icon: Icon(
            Icons.search,
            size: Theme.of(context).appBarTheme.iconTheme!.size,
            color: Theme.of(context).appBarTheme.iconTheme!.color,
          ),
        ),
      ],
    );
  }
}
